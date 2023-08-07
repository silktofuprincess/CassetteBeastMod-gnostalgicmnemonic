extends BaseItem
class_name StickerItem

const BASE_VALUE:int = 100
const VALUE_PER_AP:int = 100
const PASSIVE_VALUE:int = 1000
const RARITY_VALUE:Dictionary = {
	Rarity.RARITY_COMMON:0, 
	Rarity.RARITY_UNCOMMON:300, 
	Rarity.RARITY_RARE:1000
}
const MAX_ATTRIBUTE_VALUE:int = 200

export (Resource) var battle_move:Resource setget set_battle_move
export (Rarity) var rarity = Rarity.RARITY_COMMON setget set_rarity, get_rarity
export (Array, Resource) var attributes:Array setget set_attributes

var modified_move:Resource

func set_battle_move(value:Resource):
	battle_move = value
	icon = get_sticker_icon(battle_move)
	description = ""
	category = "stickers"
	consume_on_use = true
	discardable = true
	usable_contexts = ContextKind.CONTEXT_TAPE | ContextKind.CONTEXT_WORLD
	recycle_to = preload("res://data/items/pulp.tres")
	modified_move = null
	reset_name()
	reappraise_value()

func set_rarity(value):
	rarity = value
	reset_name()
	reappraise_value()

func get_rarity():
	return rarity

func set_attributes(value:Array):
	attributes = value
	
	var max_attribute_rarity = Rarity.RARITY_COMMON
	for i in range(attributes.size()):
		if attributes[i].is_template():
			
			
			
			attributes[i] = attributes[i].instance()
			attributes[i].generate(battle_move, Random.new())
		max_attribute_rarity = int(max(max_attribute_rarity, attributes[i].rarity))
	
	modified_move = null
	
	if max_attribute_rarity != rarity:
		set_rarity(max_attribute_rarity)
	
	reappraise_value()

func get_modified_move()->Resource:
	
	assert (battle_move != null)
	if not modified_move:
		modified_move = battle_move.instance()
		modified_move.attributes = attributes
		modified_move.rarity = rarity
		for attribute in attributes:
			attribute.modify_move(modified_move)
	return modified_move

static func get_sticker_icon(battle_move:Resource)->Texture:
	if battle_move and battle_move.elemental_types.size() > 0:
		return battle_move.elemental_types[0].icon
	else :
		return preload("res://ui/icons/types/element_typeless.png")

func reset_name():
	name = Loc.trf("ITEM_NAME_RARITY_" + str(int(rarity)), {
		"item_name":battle_move.name if battle_move else "???"
	})

func get_sortable_name()->String:
	return battle_move.name

static func appraise_move(battle_move:Resource)->int:
	var value = BASE_VALUE
	if battle_move:
		value += VALUE_PER_AP * battle_move.cost
		if battle_move.is_passive_only:
			value += PASSIVE_VALUE
	return value

func reappraise_value():
	value = appraise_move(battle_move)
	
	assert (RARITY_VALUE.has(rarity))
	value += RARITY_VALUE[rarity]
	
	for attribute in attributes:
		value += int(attribute.get_perfection() * MAX_ATTRIBUTE_VALUE)

func get_use_options(_node, context_kind:int, context)->Array:
	if context_kind == ContextKind.CONTEXT_TAPE:
		return [{"label":"UI_PARTY_APPLY_STICKER", "arg":context}]
	
	var tapes = SaveState.party.get_tapes()
	var any_compatible = false
	for tape in tapes:
		if BattleMoves.is_compatible(tape, get_modified_move()):
			any_compatible = true
			break
	
	return [{
		"label":"ITEM_APPLY_STICKER_SUBMENU", 
		"disabled": not any_compatible, 
		"arg":null
	}]

func custom_use_menu(_node, context_kind:int, context, arg = null):
	if arg != null:
		return arg
	
	assert ((context_kind & ContextKind.CONTEXT_BATTLE) == 0)
	
	var tapes = SaveState.party.get_tapes()
	
	return MenuHelper.show_choose_tape_menu(tapes, Bind.new(self, "_tape_filter"), Bind.new(self, "_tape_menu_callback", [context_kind, context]))

func _tape_filter(tape:Resource)->bool:
	return BattleMoves.is_compatible(tape, get_modified_move())

func _tape_menu_callback(_context_kind:int, _context, tape:Resource, _button:Control):
	return MenuHelper.party_apply_sticker_to_tape(tape, self)

func use(_node, _context_kind:int, _context, arg = null):
	return bool(arg)

func matches(other_item:BaseItem)->bool:
	if other_item == self:
		return true
	if other_item == null:
		return false
	return other_item.get_script() == get_script() and other_item.battle_move == battle_move and other_item.rarity == rarity and attributes.size() == 0

func get_snapshot():
	assert (battle_move.resource_path != "")
	var snap = {
		"sticker":battle_move.resource_path, 
		"rarity":int(rarity), 
		"attributes":[]
	}
	for attribute in attributes:
		snap.attributes.push_back(attribute.get_snapshot())
	return snap

func set_snapshot(snap, version:int)->bool:
	rarity = int(snap.get("rarity", Rarity.RARITY_COMMON))
	attributes = []
	var move = load(snap.sticker) as BattleMove
	if not move:
		return false
	set_battle_move(move)
	if snap.has("attributes"):
		for attr_snap in snap.attributes:
			var attr = StickerAttribute.recreate_snapshot(attr_snap, version)
			if attr:
				attributes.push_back(attr)
	reappraise_value()
	return true
