extends BaseItem

export (Array, PackedScene) var HoneyTest: [ "res://cutscenes/camping/Viola18.tscn" ]

func get_use_options(_node, _context_kind:int, _context)->Array:
	return [{"label":"ITEM_READ", "arg":null}]

func custom_use_menu(_node, _context_kind:int, _context, _arg = null):
	Cutscene._ready(HoneyTest)
