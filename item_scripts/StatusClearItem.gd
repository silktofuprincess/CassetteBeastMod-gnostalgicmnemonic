extends BaseItem

export (Array, Script) var clear_status_types:Array
export (bool) var clear_extended_status_types:bool = true
export (Array, Resource) var clear_statuses:Array
export (Array, Resource) var battle_vfx:Array = []

func get_use_options(node, context_kind:int, context)->Array:
	if context_kind & ContextKind.CONTEXT_BATTLE != 0:
		return [{
				"label":"ITEM_USE_ON_SUBMENU", 
				"arg":{"use_target_menu":true}
			}]
	return .get_use_options(node, context_kind, context)

func _use_in_battle(_node, context, arg):
	var battle = context.battle
	
	assert (arg.has("target_slots"))
	var affected_any = false
	for slot in arg.target_slots:
		var fighter = slot.get_fighter()
		if not fighter or not _will_any_be_cleared(fighter):
			continue
		
		battle.queue_animation(Bind.new(self, "_animate_in_battle", [battle, fighter, fighter.status.get_snapshot()]))
		
		for status in fighter.status.get_effects():
			if _should_be_cleared(status.effect):
				status.remove()
		
		affected_any = true
	
	yield (battle.wait_for_animations(), "completed")
	
	return affected_any

func are_targets_valid(user, targets:Array)->bool:
	
	for fighter in targets:
		if fighter.team == user.team and _will_any_be_cleared(fighter):
			return true
	return false

func get_effect_hint(target)->Vector3:
	var result = Vector3()
	for status in target.status.get_effects():
		if _should_be_cleared(status.effect):
			var status_hint = status.effect.get_effect_hint(target)
			result += Vector3(status_hint.x, status_hint.z, status_hint.y)
	if result == Vector3():
		result = Vector3(0, 0, 1)
	return result

func _will_any_be_cleared(fighter)->bool:
	for status in fighter.status.get_effects():
		if _should_be_cleared(status.effect):
			return true
	return false

func _is_instance(types:Array, object:Object)->bool:
	var script = object.get_script() as Script
	while script != null:
		if types.has(script):
			return true
		script = script.get_base_script()
	return false

func _should_be_cleared(status_effect:StatusEffect)->bool:
	if clear_extended_status_types:
		if _is_instance(clear_status_types, status_effect):
			return true
	else :
		for type in clear_status_types:
			if status_effect.get_script() == type:
				return true
	return clear_statuses.has(status_effect)

func _animate_in_battle(_battle, fighter, snapshot):
	var co_list = []
	if fighter.status_bubble:
		co_list.push_back(fighter.status_bubble.set_snapshot(snapshot))
	if battle_vfx.size() > 0:
		co_list.push_back(fighter.animate_vfx_sequence(battle_vfx))
	return Co.join(co_list)
