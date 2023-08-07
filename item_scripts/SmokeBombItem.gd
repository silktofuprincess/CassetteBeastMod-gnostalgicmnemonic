extends BaseItem
class_name SmokeBombItem

export (Array, Resource) var battle_vfx:Array = []

func get_use_options(_node, context_kind:int, context)->Array:
	var battle = context.battle if (context_kind & ContextKind.CONTEXT_BATTLE) != 0 else null
	return [{
		label = "ITEM_USE", 
		disabled = battle and not battle.can_flee, 
		arg = null
	}]

func _use_in_battle(_node, fighter, _arg):
	var battle = fighter.battle
	
	battle.queue_animation(Bind.new(self, "_animate_in_battle", [battle, fighter]))
	
	return true

func _animate_in_battle(_battle, fighter):
	return fighter.animate_vfx_sequence(battle_vfx)
