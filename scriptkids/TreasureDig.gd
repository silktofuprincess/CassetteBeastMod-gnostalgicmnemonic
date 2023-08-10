extends BattleMove

export (Resource) var loot_table_high_level:Resource
export (Resource) var loot_table_low_level:Resource
export (int) var max_value:int = 1000
export (Color) var toast_color:Color = Color(-238922241)

func _execute(battle, fighter, _argument, _attack_params):
	var acc = _modify_with_attributes_int(fighter, "move_accuracy", accuracy)
	if not battle.rand.rand_bool(BattleFormulas.get_hit_chance(acc, fighter, null)):
		battle.queue_animate_turn_failed()
		return 
	
	var loot_table = loot_table_low_level
	for f in battle.get_fighters(false):
		if f.team == fighter.team:continue
		if f.status.level >= fighter.status.level:
			loot_table = loot_table_high_level
			break
	
	var loot = loot_table.generate_rewards(battle.rand.get_child("treasure_dig"), max_value, 1)
	if loot.size() == 0:
		battle.queue_animate_turn_failed()
		return 
	
	for entry in loot:
		entry.category = "LOOT_HEADING_TREASURE"
	
	battle.extra_loot += loot
	
	var message = Loc.trf("ITEM_EXCHANGE_MULTIPLE", [loot[0].item.get_name(), loot[0].amount])
	var toast = battle.create_toast()
	toast.setup_text(message, toast_color, loot[0].item.icon)
	toast.number_text = "MOVE_TREASURE_DIG_TOAST"
	battle.queue_play_toast(toast, fighter.slot)
	
