extends Reference

func start_up():
	SaveState.connect("flag_changed", self, "check_flag")
	SaveState.set_flag("player_has_romanced", false)

func check_flag(flag, value):
	if flag == "player_has_romanced" && value == true:
		SaveState.set_flag("player_has_romanced", false)
