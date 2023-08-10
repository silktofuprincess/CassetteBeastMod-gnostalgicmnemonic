extends "res://data/item_scripts/TapeHealingItem.gd"

func can_heal_allies()->bool:
	return false

func _tape_filter(tape:MonsterTape)->bool:
	return tape.is_broken() and ( not SaveState.game_mode or not SaveState.game_mode.permadeath_tapes)
