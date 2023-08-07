extends BaseItem

export (float) var duration:int = 60.0
export (PackedScene) var cutscene:PackedScene

func _use_in_world(_node, _context, _arg):
	WorldSystem.reodorant_timer += duration
	
	if cutscene:
		var sc = cutscene.instance()
		SceneManager.current_scene.add_child(sc)
		sc.free_cutscene_on_exit = true
		sc.run()
	
	return true
