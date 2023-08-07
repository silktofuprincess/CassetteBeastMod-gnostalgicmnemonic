extends BaseItem

func get_rarity():
	return Rarity.RARITY_RARE

func get_use_options(node, context_kind:int, context)->Array:
	if context_kind == ContextKind.CONTEXT_WORLD:
		var result = []
		var characters = SaveState.party.characters
		for character in characters:
			if character.partner_id != "" and not SaveState.party.is_partner_unlocked(character.partner_id):
				continue
			result.push_back({
				"label":Loc.trgf("ITEM_USE_ON", character.pronouns, [character.name]), 
				"disabled":character.level >= Character.MAX_LEVEL, 
				"arg":character
			})
		return result
	return .get_use_options(node, context_kind, context)

func _use_in_world(_node, _context, character):
	yield (MenuHelper.level_up(character), "completed")
	return true
