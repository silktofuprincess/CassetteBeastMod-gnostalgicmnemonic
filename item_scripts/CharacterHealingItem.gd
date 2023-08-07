extends BaseItem

export (int) var hp_to_heal:int = - 1
export (Array, Resource) var battle_vfx:Array = []

func get_use_options(node, context_kind:int, context)->Array:
	if context_kind & (ContextKind.CONTEXT_WORLD | ContextKind.CONTEXT_CHARACTER) != 0:
		var result = []
		var characters = SaveState.party.characters
		if context_kind == ContextKind.CONTEXT_CHARACTER:
			characters = [context]
		for character in characters:
			if character.partner_id != "" and not SaveState.party.is_partner_unlocked(character.partner_id):
				continue
			result.push_back({
				"label":Loc.trgf("ITEM_USE_ON", character.pronouns, [character.name]), 
				"arg":character
			})
		return result
	return .get_use_options(node, context_kind, context)

func _use_in_world(_node, _context, character):
	assert (character.tapes.size() > 0)
	var max_hp = BattleFormulas.get_stat("max_hp", character.base_max_hp, BattleFormulas.NEUTRAL_STAT, character.level)
	
	if hp_to_heal >= 0:
		var new_hp = character.hp.to_int(max_hp) + hp_to_heal
		if new_hp > max_hp:
			new_hp = max_hp
		
		character.hp.set_to(new_hp, max_hp)
	else :
		character.hp.set_to(max_hp, max_hp)
	
	
	return true

func _use_in_battle(_node, fighter, _arg):
	var battle = fighter.battle
	fighter.status.backing_hp += hp_to_heal
	fighter.status.hp += hp_to_heal
	var snapshot = fighter.status.get_snapshot()
	battle.queue_animation(Bind.new(self, "_animate_in_battle", [battle, fighter, snapshot]))
	return true

func _animate_in_battle(_battle, fighter, snapshot):
	var co_list = []
	if battle_vfx.size() > 0:
		co_list.push_back(fighter.animate_vfx_sequence(battle_vfx))
	if fighter.status_bubble:
		co_list.push_back(fighter.status_bubble.set_snapshot(snapshot, true))
	yield (Co.join(co_list), "completed")
