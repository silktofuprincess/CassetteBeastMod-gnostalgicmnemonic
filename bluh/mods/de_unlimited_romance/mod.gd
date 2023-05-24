extends ContentInfo

var unflag_romance: Reference = preload("res://mods/de_unlimited_romance/uncheck_romanced.gd").new()

func _init():
	TranslationServer.add_translation(preload("de_mod_strings.en.translation"))


func init_content() -> void:
	SaveSystem.connect("file_loaded", self, "_on_SaveSystem_file_loaded")

	var res: Resource = preload("MeredithConvo11.tscn")
	res.take_over_path("res://cutscenes/camping/MeredithConvo11.tscn")
	var res_two: Resource = preload("KayleighConvo12.tscn")
	res_two.take_over_path("res://cutscenes/camping/KayleighConvo12.tscn")


func _on_SaveSystem_file_loaded() -> void:
	unflag_romance.start_up()
