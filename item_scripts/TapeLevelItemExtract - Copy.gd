extends BaseItem


func get_rarity():
	return Rarity.RARITY_RARE

func get_use_options(_node, _context_kind:int, _context)->Array:
	return [{"label":"ITEM_USE_ON_SUBMENU", "arg":null}]

func custom_use_menu(_node, _context_kind:int, _context, arg = null):
	if arg != null:
		return arg
	
	var tapes = SaveState.party.get_tapes()
	return MenuHelper.show_choose_tape_menu(tapes, Bind.new(self, "_tape_filter"))

func _tape_filter(tape:MonsterTape)->bool:
	return not tape.is_broken()

func _use_in_world(_node, _context, arg):
	assert (arg is MonsterTape)
	if not (arg is MonsterTape):
		return false
	yield (wine_up(arg), "completed")
	return true


func wine_up(tape:MonsterTape):
	tape.grade += 5
	
	var upgrade = tape.get_upgrade(tape.grade)
	assert (upgrade != null)
	var result = upgrade.apply_player(tape)
	if result is LootRecord:
		assert (result.tape == tape)
		if result.sticker_index == - 1 and not result.dropped:
			SaveState.inventory.add_new_item(result.item, result.amount)
	return result
