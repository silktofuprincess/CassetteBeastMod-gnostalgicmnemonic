extends BaseItem

export (int, 0, 100) var fill_amount:int = 100

func get_use_options(_node, _context_kind:int, _context)->Array:
	return [{
		label = "ITEM_USE", 
		disabled = not is_fusion_unlocked() or SaveState.party.fusion_meter.is_full(), 
		arg = null
	}]

func is_fusion_unlocked()->bool:
	if SaveState.party.partner.is_fusion_unlocked():
		return true
	var battle = SceneManager.current_scene as Battle
	if battle:
		return battle.unlock_fusion
	return false

func custom_use_menu(_node, _context_kind:int, _context, _arg = null):
	SaveState.party.fusion_meter.fill(Rational.new(fill_amount, 100))
	if Notifications.fusion_meter.showing:
		yield (Notifications.fusion_meter, "hiding")
	return {already_used = true}

func use(_node, _context_kind:int, _context, arg = null):
	assert (arg and arg.already_used)
	return true
