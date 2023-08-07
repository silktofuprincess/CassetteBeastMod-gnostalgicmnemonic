extends BaseItem
class_name BlankTape

const RecordingEffect = preload("res://data/status_effect_scripts/Recording.gd")

export (int) var capture_rate:int = 100
export (Resource) var type_affinity:Resource
export (int) var type_affinity_rate_boost:int
export (Resource) var force_bootleg_type:Resource
export (Rarity) var rarity = Rarity.RARITY_COMMON setget , get_rarity

func get_rarity():
	return rarity

func get_use_options(_node, context_kind:int, context)->Array:
	if context_kind == ContextKind.CONTEXT_BATTLE:
		assert (context is FighterNode)
		if context.can_record():
			for fighter in context.battle.get_fighters(false):
				if fighter.team == context.team or not fighter.is_recordable():
					continue
				return [{
					"label":"ITEM_USE_ON_SUBMENU", 
					"arg":{"use_target_menu":true}
				}]
	return []

func are_targets_valid(user, targets:Array)->bool:
	
	for target in targets:
		if _is_usable(user, target):
			return true
	return false

func get_effect_hint(_target)->Vector3:
	return Vector3()

func _use_in_battle(_node, fighter, arg):
	assert (arg.has("target_slots"))
	assert (arg.target_slots.size() == 1)
	var target = arg.target_slots[0].get_fighter()
	assert (target is FighterNode)
	
	var battle = fighter.battle
	assert (is_instance_valid(fighter) and fighter is FighterNode)
	if not _is_usable(fighter, target):
		battle.queue_animation(Bind.new(self, "_animate_failure", [battle, fighter]))
		return false
	
	var effect = RecordingEffect.new()
	effect.tape_rate = capture_rate
	effect.type_affinity = type_affinity
	effect.type_affinity_rate_boost = type_affinity_rate_boost
	effect.force_bootleg_type = force_bootleg_type
	effect.target = target
	fighter.status.add_effect(effect, 1)
	
	return true

func _is_usable(fighter, target):
	if not is_instance_valid(target) or not (target is FighterNode):
		return false
	return target.team != fighter.team and fighter.can_record() and target.is_recordable()

func _animate_failure(battle, fighter):
	var toast = battle.create_toast()
	toast.setup_text("STATUS_RECORDING_TOAST_FAILURE")
	return battle.play_toast(toast, fighter.slot)
