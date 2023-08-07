extends BaseItem

func get_use_options(_node, _context_kind:int, _context)->Array:
	return [{"label":"ITEM_OPEN", "arg":null}]

func custom_use_menu(_node, _context_kind:int, _context, _arg = null):
	var menu = preload("res://menus/type_chart/TypeChartBox.tscn").instance()
	MenuHelper.add_child(menu)
	yield (menu.run_menu(), "completed")
	MenuHelper.remove_child(menu)
	menu.queue_free()
