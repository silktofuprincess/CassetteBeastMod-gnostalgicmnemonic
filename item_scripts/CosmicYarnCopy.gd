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
		if fighter.status.ap > 0:
			return true
	return false

func get_effect_hint(target)->Vector3:
	if target.status.ap > 0:
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
		
		fighter.status.change_ap(-1)
		var snapshot = fighter.status.get_snapshot()

		weymark_Kunecho(battle, fighter)

		affected_any = true
	
	return affected_any

func weymark_Kunecho(battle, fighter):

	battle.rand.shuffle(valid_moves)
	for move in valid_moves:
		var args = {}
		var config_result = move.configure(battle, fighter, args, null)
		assert ( not (config_result is GDScriptFunctionState))
		if config_result:
			var order = BattleOrder.new(fighter, BattleOrder.OrderType.FIGHT, move, args)
			battle.queue_turn_action(order)
			return 
