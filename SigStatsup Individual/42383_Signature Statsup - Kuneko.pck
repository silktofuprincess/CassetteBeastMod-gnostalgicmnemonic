GDPC                                                                                  res://mods/metadata.tres,                            $   res://data/monster_forms/kuneko.tres?      �                      ,   res://data/monster_forms/shining_kuneko.tres.      .                      [gd_resource type="Resource" load_steps=2 format=2]

[ext_resource path="res://data/ContentInfo.gd" type="Script" id=1]

[resource]
script = ExtResource( 1 )
id = "SignatureStatsupKuneko"
name = "Signature Statsup - Kuneko"
version_code = 1
version_string = "1.0"
author = "gnostalgicMnemonic"
save_file_format_tag = ""
save_file_format_tag_version = 0
network_protocol_tag = "SignatureStatsupKuneko1"
modified_files = [ "res://data/monster_forms/kuneko.tres", "res://data/monster_forms/shining_kuneko.tres" ]
modified_dirs = [  ]
[gd_resource type="Resource" load_steps=20 format=2]

[ext_resource path="res://data/MonsterForm.gd" type="Script" id=1]
[ext_resource path="res://data/elemental_types/air.tres" type="Resource" id=3]
[ext_resource path="res://data/Evolution.gd" type="Script" id=4]
[ext_resource path="res://data/battle_moves/smack.tres" type="Resource" id=5]
[ext_resource path="res://data/monster_forms/shining_kuneko.tres" type="Resource" id=6]
[ext_resource path="res://data/battle_moves/elemental_wall.tres" type="Resource" id=8]
[ext_resource path="res://data/battle_moves/bad_joke.tres" type="Resource" id=9]
[ext_resource path="res://data/battle_moves/double_slice.tres" type="Resource" id=10]
[ext_resource path="res://data/tape_upgrade_scripts/TapeUpgradeMove.gd" type="Script" id=11]
[ext_resource path="res://data/battle_moves/sharp_edges.tres" type="Resource" id=12]
[ext_resource path="res://data/battle_moves/wink.tres" type="Resource" id=13]
[ext_resource path="res://data/battle_moves/be_random.tres" type="Resource" id=14]
[ext_resource path="res://ui/monster_stickers/kuneko.png" type="Texture" id=15]
[ext_resource path="res://sfx/cries/kuneko_cry.wav" type="AudioStream" id=16]
[ext_resource path="res://sfx/voices/kuneko/kuneko_defeat.wav" type="AudioStream" id=17]

[sub_resource type="Resource" id=1]
resource_name = "shining_kuneko"
script = ExtResource( 4 )
evolved_form = ExtResource( 6 )
required_tape_grade = 5
min_hour = 0.0
max_hour = 24.0
required_location = ""
specialization = ""
is_secret = false

[sub_resource type="Resource" id=2]
resource_name = "Slot + double_slice"
script = ExtResource( 11 )
add_slot = true
sticker = ExtResource( 10 )

[sub_resource type="Resource" id=3]
resource_name = "Slot + sharp_edges"
script = ExtResource( 11 )
add_slot = true
sticker = ExtResource( 12 )

[sub_resource type="Resource" id=4]
resource_name = "Slot + bad_joke"
script = ExtResource( 11 )
add_slot = true
sticker = ExtResource( 9 )

[resource]
script = ExtResource( 1 )
name = "KUNEKO_NAME"
swap_colors = [ Color( 0.223529, 0.235294, 0.298039, 1 ), Color( 0.384314, 0.423529, 0.517647, 1 ), Color( 0.615686, 0.67451, 0.764706, 1 ), Color( 0.807843, 0.882353, 0.933333, 1 ), Color( 0.92549, 0.960784, 0.972549, 1 ), Color( 0.219608, 0.137255, 0.462745, 1 ), Color( 0.462745, 0.160784, 0.858824, 1 ), Color( 0.713726, 0.329412, 0.94902, 1 ), Color( 0.815686, 0.529412, 0.972549, 1 ), Color( 0.890196, 0.686275, 0.996078, 1 ), Color( 0.0901961, 0.0901961, 0.207843, 1 ), Color( 0.152941, 0.160784, 0.309804, 1 ), Color( 0.215686, 0.247059, 0.403922, 1 ), Color( 0.341176, 0.384314, 0.556863, 1 ), Color( 0.513726, 0.564706, 0.72549, 1 ) ]
default_palette = [  ]
emission_palette = [  ]
battle_cry = ExtResource( 16 )
defeat_cry = ExtResource( 17 )
named_positions = {
"attack": Vector2( 97, 32 ),
"decoy": Vector2( 79, 79 ),
"eye": Vector2( 51, 55 ),
"hit": Vector2( 50, 59 )
}
elemental_types = [ ExtResource( 3 ) ]
tape_sticker_texture = ExtResource( 15 )
exp_yield = 40
require_dlc = ""
battle_sprite_path = "res://sprites/monsters/kuneko.json"
ui_sprite_path = ""
pronouns = 1
description = "KUNEKO_DESCRIPTION"
max_hp = 125
melee_attack = 125
melee_defense = 125
ranged_attack = 125
ranged_defense = 125
speed = 125
accuracy = 100
evasion = 100
max_ap = 10
move_slots = 5
evolutions = [ SubResource( 1 ) ]
evolution_specialization_question = ""
capture_rate = 3
exp_gradient = 21
exp_base_level = 0
move_tags = [ "kuneko", "cat", "animal", "cute", "fast", "deception", "psychic", "annoy", "knife", "run", "teeth", "hands", "spirit", "healer", "righteous" ]
initial_moves = [ ExtResource( 5 ), ExtResource( 13 ) ]
tape_upgrades = [ SubResource( 2 ), SubResource( 3 ), SubResource( 4 ), ExtResource( 8 ), ExtResource( 14 ) ]
unlock_ability = ""
fusion_name_prefix = "KUNEKO_NAME_PREFIX"
fusion_name_suffix = "KUNEKO_NAME_SUFFIX"
fusion_generator_path = "res://data/fusions/kuneko.tscn"
bestiary_index = 110
bestiary_category = 0
bestiary_bios = [ "KUNEKO_LORE_1", "KUNEKO_LORE_2" ]
bestiary_data_requirement = 0
bestiary_data_requirement_flag = ""
loot_table = ""
[gd_resource type="Resource" load_steps=18 format=2]

[ext_resource path="res://data/MonsterForm.gd" type="Script" id=1]
[ext_resource path="res://data/battle_moves/smack.tres" type="Resource" id=2]
[ext_resource path="res://data/elemental_types/astral.tres" type="Resource" id=4]
[ext_resource path="res://data/battle_moves/bad_joke.tres" type="Resource" id=5]
[ext_resource path="res://data/battle_moves/double_slice.tres" type="Resource" id=6]
[ext_resource path="res://data/battle_moves/sharp_edges.tres" type="Resource" id=7]
[ext_resource path="res://data/battle_moves/cosmic_kunai.tres" type="Resource" id=8]
[ext_resource path="res://data/battle_moves/air_wall.tres" type="Resource" id=9]
[ext_resource path="res://data/battle_moves/wink.tres" type="Resource" id=10]
[ext_resource path="res://data/battle_moves/ritual.tres" type="Resource" id=12]
[ext_resource path="res://data/battle_moves/be_random.tres" type="Resource" id=13]
[ext_resource path="res://data/battle_moves/galactic_beatdown.tres" type="Resource" id=14]
[ext_resource path="res://data/battle_moves/shooting_star.tres" type="Resource" id=15]
[ext_resource path="res://data/battle_moves/broadcast.tres" type="Resource" id=16]
[ext_resource path="res://ui/monster_stickers/shining_kuneko.png" type="Texture" id=17]
[ext_resource path="res://sfx/cries/shining_kuneko_cry.wav" type="AudioStream" id=18]
[ext_resource path="res://sfx/voices/kuneko/kuneko_defeat.wav" type="AudioStream" id=19]

[resource]
script = ExtResource( 1 )
name = "SHINING_KUNEKO_NAME"
swap_colors = [ Color( 0.223529, 0.235294, 0.298039, 1 ), Color( 0.384314, 0.423529, 0.517647, 1 ), Color( 0.615686, 0.67451, 0.764706, 1 ), Color( 0.807843, 0.882353, 0.933333, 1 ), Color( 0.92549, 0.960784, 0.972549, 1 ), Color( 0.219608, 0.137255, 0.462745, 1 ), Color( 0.462745, 0.160784, 0.858824, 1 ), Color( 0.713726, 0.329412, 0.94902, 1 ), Color( 0.815686, 0.529412, 0.972549, 1 ), Color( 0.890196, 0.686275, 0.996078, 1 ), Color( 0.470588, 0.14902, 0.14902, 1 ), Color( 0.611765, 0.290196, 0.207843, 1 ), Color( 0.85098, 0.541176, 0.188235, 1 ), Color( 0.945098, 0.760784, 0.333333, 1 ), Color( 0.972549, 0.901961, 0.545098, 1 ) ]
default_palette = [  ]
emission_palette = [ Color( 0.454902, 0.282353, 0.898039, 1 ), Color( 0.701961, 0.466667, 0.972549, 1 ), Color( 0.890196, 0.686275, 0.996078, 1 ), Color( 1, 1, 1, 1 ) ]
battle_cry = ExtResource( 18 )
defeat_cry = ExtResource( 19 )
named_positions = {
"attack": Vector2( 112, 36 ),
"decoy": Vector2( 80, 82 ),
"eye": Vector2( 60, 32 ),
"hit": Vector2( 59, 43 )
}
elemental_types = [ ExtResource( 4 ) ]
tape_sticker_texture = ExtResource( 17 )
exp_yield = 40
require_dlc = ""
battle_sprite_path = "res://sprites/monsters/shining_kuneko.json"
ui_sprite_path = ""
pronouns = 1
description = "SHINING_KUNEKO_DESCRIPTION"
max_hp = 140
melee_attack = 140
melee_defense = 140
ranged_attack = 140
ranged_defense = 140
speed = 140
accuracy = 100
evasion = 100
max_ap = 10
move_slots = 8
evolutions = [  ]
evolution_specialization_question = ""
capture_rate = 3
exp_gradient = 21
exp_base_level = 21
move_tags = [ "kuneko", "cat", "animal", "cute", "fast", "deception", "psychic", "annoy", "knife", "run", "teeth", "hands", "air", "spirit", "healer", "righteous" ]
initial_moves = [ ExtResource( 2 ), ExtResource( 10 ), ExtResource( 6 ), ExtResource( 7 ), ExtResource( 5 ), ExtResource( 9 ), ExtResource( 13 ) ]
tape_upgrades = [ ExtResource( 12 ), ExtResource( 15 ), ExtResource( 14 ), ExtResource( 16 ), ExtResource( 8 ) ]
unlock_ability = ""
fusion_name_prefix = "SHINING_KUNEKO_NAME_PREFIX"
fusion_name_suffix = "SHINING_KUNEKO_NAME_SUFFIX"
fusion_generator_path = "res://data/fusions/shining_kuneko.tscn"
bestiary_index = 111
bestiary_category = 0
bestiary_bios = [ "SHINING_KUNEKO_LORE_1", "SHINING_KUNEKO_LORE_2" ]
bestiary_data_requirement = 0
bestiary_data_requirement_flag = ""
loot_table = ""
