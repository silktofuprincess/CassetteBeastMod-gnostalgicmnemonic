extends BaseItem

const TypeChart = preload("res://data/items/type_chart.tres")

func get_use_options(_node, _context_kind:int, _context)->Array:
	return [{"label":"ITEM_READ", "arg":null}]

func custom_use_menu(_node, _context_kind:int, _context, _arg = null):
	yield (show_tutorials(), "completed")
	
	if not SaveState.inventory.has_item(TypeChart):
		GlobalMessageDialog.clear_state()
		yield (GlobalMessageDialog.show_message("ITEM_TUTORIAL_GIVE_TYPE_CHART"), "completed")
		
		yield (MenuHelper.give_item(TypeChart, 1, false), "completed")

func show_tutorials():
	GlobalMessageDialog.clear_state()
	
	var tutorial_ids = []
	var options = []
	for id in MenuHelper.tutorials.keys():
		if SaveState.has_flag("tutorial_" + id):
			tutorial_ids.push_back(id)
			options.push_back(MenuHelper.tutorials[id].title)
	options.push_back("UI_BUTTON_CANCEL")
	
	if tutorial_ids.size() == 0:
		yield (GlobalMessageDialog.show_message("ITEM_TUTORIAL_NO_TUTS"), "completed")
		return 
	
	while true:
		yield (GlobalMessageDialog.show_message("ITEM_TUTORIAL_MESSAGE", false, false), "completed")
		var choice = yield (GlobalMenuDialog.show_menu(options, options.size() - 1), "completed")
		yield (GlobalMessageDialog.hide(), "completed")
		
		if choice >= 0 and choice < tutorial_ids.size():
			yield (MenuHelper.show_tutorial(tutorial_ids[choice]), "completed")
		else :
			return 
