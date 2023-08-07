extends BaseItem

func get_name()->String:
	return Loc.trf(.get_name(), get_description_params())

func get_aux_name()->String:
	return Loc.trf(.get_aux_name(), get_description_params())

func get_description()->String:
	return Loc.trf(.get_description(), get_description_params())

func get_description_params()->Dictionary:
	var tree = Engine.get_main_loop() as SceneTree
	if not tree:
		return {}
	var save_state = tree.get_root().get_node(NodePath("SaveState"))
	if not save_state:
		return {}
	return {
		ranger_rank = save_state.get_ranger_rank(), 
		ranger_id = save_state.get_ranger_id()
	}

func get_use_options(_node, _context_kind:int, _context)->Array:
	return [{"label":"ITEM_VIEW", "arg":null}]

func custom_use_menu(_node, _context_kind:int, _context, _arg = null):
	return MenuHelper.show_ranger_stamp_card()
