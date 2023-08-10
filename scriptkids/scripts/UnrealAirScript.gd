extends BaseItem

func get_use_options(_node, _context_kind:int, _context)->Array:
	return [{"label":"Contemplate teacake.", "arg":null}]

func _use_in_world(_node, _context, _character):
	var cutscene_node = load("res://data/item_scripts/breakfast_time_subscripts/UnrealAirCutscene.tscn") 
	var instanced_cutscene = cutscene_node.instance()
	MenuHelper.add_child(instanced_cutscene)
	instanced_cutscene.run()
	yield (instanced_cutscene.run(), "completed")
	instanced_cutscene.queue_free()
	return true
