extends BaseItem

func _use_in_world(_node, _context, _player):
		
	for player in WorldSystem.get_player_characters():
		player.tween_scale(.53)
	
	return true
