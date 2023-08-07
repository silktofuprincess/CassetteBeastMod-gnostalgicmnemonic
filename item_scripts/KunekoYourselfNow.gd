extends BaseItem

export (Array, Resource) var valid_moves:Array

func get_use_options(node, context_kind:int, context)->Array:
	if context_kind & ContextKind.CONTEXT_BATTLE != 0:
		return [{
				"label":"ITEM_USE_ON_SUBMENU", 
				"arg":{"use_target_menu":true}
			}]
	return .get_use_options(node, context_kind, context)

func are_targets_valid(user, targets:Array)->bool:
	
	for fighter in targets:
		if fighter.team == user.team:
			return true
	return false

func get_effect_hint(target)->Vector3:
	return Vector3(0, 0, 1)

func _use_in_battle(_node, context, arg):
	var battle = context.battle
	
	assert (arg.has("target_slots"))
	var affected_any = false
	for slot in arg.target_slots:
		var fighter = slot.get_fighter()
		if fighter == null:
			continue

		fighter.status.change_ap(10)
		
		kuneko_yourself_now(fighter)

		affected_any = true
	
	return affected_any

func kuneko_yourself_now(fighter):
	fighter.get_controller().die()
	fighter.get_controller().die()
