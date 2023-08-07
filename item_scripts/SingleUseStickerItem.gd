extends BaseItem
class_name SingleUseStickerItem

const BASE_VALUE:int = 100
const VALUE_PER_AP:int = 100

export (Resource) var battle_move:Resource setget set_battle_move

func get_sort_order()->int:
	return 9999

func set_battle_move(value:Resource):
	battle_move = value
	name = Loc.trf("ITEM_SINGLEUSE_STICKER_NAME", {
		"name":battle_move.name if battle_move else "???"
	})
	icon = StickerItem.get_sticker_icon(battle_move)
	description = ""
	category = "consumables"
	consume_on_use = true
	discardable = true
	usable_contexts = ContextKind.CONTEXT_BATTLE
	recycle_to = preload("res://data/items/pulp.tres")
	reappraise_value()

func reappraise_value():
	value = BASE_VALUE
	if battle_move:
		value += VALUE_PER_AP * battle_move.cost
		assert ( not battle_move.is_passive_only)

func matches(other_item:BaseItem)->bool:
	if other_item == self:
		return true
	if other_item == null:
		return false
	return other_item.get_script() == get_script() and other_item.battle_move == battle_move

func get_snapshot():
	assert (battle_move.resource_path != "")
	return {
		"single_use_sticker":battle_move.resource_path
	}

func set_snapshot(snap, _version:int)->bool:
	var move = load(snap.single_use_sticker) as BattleMove
	if not move:
		return false
	set_battle_move(move)
	return true
