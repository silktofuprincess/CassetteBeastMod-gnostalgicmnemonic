extends BaseItem

export (int) var ap_to_restore:int = 2
export (Resource) var also_clear_status:Resource
export (Array, Resource) var battle_vfx:Array = []

func get_use_options(node, context_kind:int, context)->Array:
	if context_kind & ContextKind.CONTEXT_BATTLE != 0:
		return [{
				"label":"ITEM_USE_ON_SUBMENU", 
				"arg":{"use_target_menu":true}
			}]
	return .get_use_options(node, context_kind, context)

func are_targets_valid(user, targets:Array)->bool:
	
	for fighter in targets:
		if fighter.team == user.team and fighter.status.ap < fighter.status.max_ap:
			return true
	return false

func get_effect_hint(target)->Vector3:
	if target.status.ap < target.status.max_ap:
		return Vector3(0, 0, 1)
	return Vector3()

func _use_in_battle(_node, context, arg):
	var battle = context.battle
	
	assert (arg.has("target_slots"))
	var affected_any = false
	for slot in arg.target_slots:
		var fighter = slot.get_fighter()
		if fighter == null:
			continue
		
		fighter.status.change_ap(ap_to_restore)
		var snapshot = fighter.status.get_snapshot()
		battle.queue_animation(Bind.new(self, "_animate_in_battle", [battle, fighter, snapshot]))
		
		if also_clear_status:
			for status in fighter.status.get_effects():
				if status.effect == also_clear_status:
					status.remove()
		affected_any = true
	
	return affected_any

func _animate_in_battle(_battle, fighter, snapshot):
	var co_list = []
	if battle_vfx.size() > 0:
		co_list.push_back(fighter.animate_vfx_sequence(battle_vfx))
	if fighter.status_bubble:
		co_list.push_back(fighter.status_bubble.set_snapshot(snapshot, true))
	yield (Co.join(co_list), "completed")
