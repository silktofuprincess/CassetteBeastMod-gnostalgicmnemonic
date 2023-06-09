GDPC                                                                                  res://mods/metadata.tres&      �                      '   res://data/monster_forms/decibelle.tres                             #   res://data/monster_forms/cat-5.tres;      %                      [gd_resource type="Resource" load_steps=2 format=2]

[ext_resource path="res://data/ContentInfo.gd" type="Script" id=1]

[resource]
script = ExtResource( 1 )
id = "SignatureStatus"
name = "Signature Status"
version_code = 2
version_string = "1.1"
author = "gnostalgicMnemonic"
save_file_format_tag = ""
save_file_format_tag_version = 0
network_protocol_tag = "SignatureStatus1"
modified_files = [ "res://data/monster_forms/decibelle.tres", "res://data/monster_forms/cat-5.tres" ]
modified_dirs = [  ]
[gd_resource type="Resource" load_steps=20 format=2]

[ext_resource path="res://data/MonsterForm.gd" type="Script" id=1]
[ext_resource path="res://sfx/cries/decibelle_cry.wav" type="AudioStream" id=2]
[ext_resource path="res://data/elemental_types/air.tres" type="Resource" id=3]
[ext_resource path="res://data/battle_moves/new_leaf.tres" type="Resource" id=5]
[ext_resource path="res://data/battle_moves/spit.tres" type="Resource" id=6]
[ext_resource path="res://data/battle_moves/dodge.tres" type="Resource" id=7]
[ext_resource path="res://data/battle_moves/sonic_boom.tres" type="Resource" id=8]
[ext_resource path="res://data/battle_moves/taunt.tres" type="Resource" id=9]
[ext_resource path="res://data/battle_moves/air_wall.tres" type="Resource" id=10]
[ext_resource path="res://data/tape_upgrade_scripts/TapeUpgradeMove.gd" type="Script" id=11]
[ext_resource path="res://data/battle_moves/provoke.tres" type="Resource" id=12]
[ext_resource path="res://data/battle_moves/echolocation.tres" type="Resource" id=13]
[ext_resource path="res://data/battle_moves/hurricane.tres" type="Resource" id=14]
[ext_resource path="res://data/battle_moves/metal_riff.tres" type="Resource" id=15]
[ext_resource path="res://data/battle_moves/change_the_record.tres" type="Resource" id=16]
[ext_resource path="res://data/battle_moves/call_for_help.tres" type="Resource" id=17]
[ext_resource path="res://ui/monster_stickers/decibelle.png" type="Texture" id=18]
[ext_resource path="res://data/battle_moves/nurse.tres" type="Resource" id=19]

[sub_resource type="Resource" id=1]
resource_name = "change_the_record"
script = ExtResource( 11 )
add_slot = false
sticker = ExtResource( 16 )

[resource]
script = ExtResource( 1 )
name = "DECIBELLE_NAME"
swap_colors = [ Color( 0.223529, 0.235294, 0.298039, 1 ), Color( 0.384314, 0.423529, 0.517647, 1 ), Color( 0.615686, 0.67451, 0.764706, 1 ), Color( 0.807843, 0.882353, 0.933333, 1 ), Color( 0.92549, 0.960784, 0.972549, 1 ), Color( 0.121569, 0.0784314, 0.262745, 1 ), Color( 0.2, 0.156863, 0.462745, 1 ), Color( 0.27451, 0.282353, 0.807843, 1 ), Color( 0.376471, 0.478431, 0.921569, 1 ), Color( 0.458824, 0.686275, 0.980392, 1 ), Color( 0.121569, 0.0784314, 0.262745, 1 ), Color( 0.219608, 0.137255, 0.462745, 1 ), Color( 0.462745, 0.160784, 0.858824, 1 ), Color( 0.713726, 0.329412, 0.94902, 1 ), Color( 0.815686, 0.529412, 0.972549, 1 ) ]
default_palette = [  ]
emission_palette = [  ]
battle_cry = ExtResource( 2 )
named_positions = {
"attack": Vector2( 131, 53 ),
"decoy": Vector2( 128, 117 ),
"eye": Vector2( 94, 45 ),
"hit": Vector2( 95, 63 )
}
elemental_types = [ ExtResource( 3 ) ]
tape_sticker_texture = ExtResource( 18 )
exp_yield = 40
require_dlc = ""
battle_sprite_path = "res://sprites/monsters/decibelle.json"
ui_sprite_path = ""
pronouns = 0
description = "DECIBELLE_DESCRIPTION"
max_hp = 135
melee_attack = 100
melee_defense = 110
ranged_attack = 170
ranged_defense = 160
speed = 125
accuracy = 100
evasion = 100
max_ap = 10
move_slots = 8
evolutions = [  ]
evolution_specialization_question = ""
capture_rate = 3
exp_gradient = 21
exp_base_level = 21
move_tags = [ "sirenade", "sound", "bird", "annoy", "toy", "glitter", "fast", "flight", "charity", "cute", "healer", "cooking", "weather" ]
initial_moves = [ ExtResource( 6 ), ExtResource( 7 ), ExtResource( 8 ), ExtResource( 17 ), ExtResource( 10 ), ExtResource( 9 ), ExtResource( 5 ), ExtResource( 12 ) ]
tape_upgrades = [ ExtResource( 13 ), ExtResource( 14 ), ExtResource( 15 ), SubResource( 1 ), ExtResource( 19 ) ]
unlock_ability = ""
fusion_name_prefix = "DECIBELLE_NAME_PREFIX"
fusion_name_suffix = "DECIBELLE_NAME_SUFFIX"
fusion_generator_path = "res://data/fusions/decibelle.tscn"
bestiary_index = 25
bestiary_category = 0
bestiary_bios = [ "DECIBELLE_LORE_1", "DECIBELLE_LORE_2" ]
bestiary_data_requirement = 0
bestiary_data_requirement_flag = ""
loot_table = ""
[gd_resource type="Resource" load_steps=21 format=2]

[ext_resource path="res://data/MonsterForm.gd" type="Script" id=1]
[ext_resource path="res://data/elemental_types/lightning.tres" type="Resource" id=4]
[ext_resource path="res://data/battle_moves/smack.tres" type="Resource" id=5]
[ext_resource path="res://data/battle_moves/zoomies.tres" type="Resource" id=6]
[ext_resource path="res://data/battle_moves/copycat.tres" type="Resource" id=7]
[ext_resource path="res://data/battle_moves/fire_wall.tres" type="Resource" id=8]
[ext_resource path="res://data/battle_moves/energy_shot.tres" type="Resource" id=9]
[ext_resource path="res://data/battle_moves/criticize.tres" type="Resource" id=10]
[ext_resource path="res://data/tape_upgrade_scripts/TapeUpgradeMove.gd" type="Script" id=11]
[ext_resource path="res://data/battle_moves/double_smack.tres" type="Resource" id=12]
[ext_resource path="res://data/battle_moves/charge.tres" type="Resource" id=13]
[ext_resource path="res://data/battle_moves/battery.tres" type="Resource" id=14]
[ext_resource path="res://data/battle_moves/silicon_slash.tres" type="Resource" id=15]
[ext_resource path="res://data/battle_moves/broadcast.tres" type="Resource" id=16]
[ext_resource path="res://data/battle_moves/berserker.tres" type="Resource" id=17]
[ext_resource path="res://ui/monster_stickers/cat-5.png" type="Texture" id=18]
[ext_resource path="res://sfx/cries/cat-5_cry.wav" type="AudioStream" id=19]
[ext_resource path="res://data/battle_moves/critical_ap.tres" type="Resource" id=20]

[sub_resource type="Resource" id=1]
resource_name = "battery"
script = ExtResource( 11 )
add_slot = false
sticker = ExtResource( 14 )

[sub_resource type="Resource" id=2]
resource_name = "silicon_slash"
script = ExtResource( 11 )
add_slot = false
sticker = ExtResource( 15 )

[resource]
script = ExtResource( 1 )
name = "CAT-5_NAME"
swap_colors = [ Color( 0.0901961, 0.0901961, 0.207843, 1 ), Color( 0.152941, 0.160784, 0.309804, 1 ), Color( 0.215686, 0.247059, 0.403922, 1 ), Color( 0.341176, 0.384314, 0.556863, 1 ), Color( 0.513726, 0.564706, 0.72549, 1 ), Color( 0.470588, 0.14902, 0.14902, 1 ), Color( 0.611765, 0.290196, 0.207843, 1 ), Color( 0.85098, 0.541176, 0.188235, 1 ), Color( 0.945098, 0.760784, 0.333333, 1 ), Color( 0.972549, 0.901961, 0.545098, 1 ), Color( 0.121569, 0.0784314, 0.262745, 1 ), Color( 0.2, 0.156863, 0.462745, 1 ), Color( 0.27451, 0.282353, 0.807843, 1 ), Color( 0.376471, 0.478431, 0.921569, 1 ), Color( 0.458824, 0.686275, 0.980392, 1 ) ]
default_palette = [  ]
emission_palette = [ Color( 0.266667, 0.278431, 0.811765, 1 ), Color( 0.360784, 0.470588, 0.921569, 1 ), Color( 0.439216, 0.682353, 0.984314, 1 ), Color( 0.913725, 0.952941, 0.968627, 1 ) ]
battle_cry = ExtResource( 19 )
named_positions = {
"attack": Vector2( 93, 33 ),
"decoy": Vector2( 90, 76 ),
"eye": Vector2( 57, 18 ),
"hit": Vector2( 55, 37 )
}
elemental_types = [ ExtResource( 4 ) ]
tape_sticker_texture = ExtResource( 18 )
exp_yield = 40
require_dlc = ""
battle_sprite_path = "res://sprites/monsters/cat-5.json"
ui_sprite_path = ""
pronouns = 0
description = "CAT-5_DESCRIPTION"
max_hp = 150
melee_attack = 160
melee_defense = 100
ranged_attack = 120
ranged_defense = 120
speed = 150
accuracy = 100
evasion = 100
max_ap = 10
move_slots = 8
evolutions = [  ]
evolution_specialization_question = ""
capture_rate = 3
exp_gradient = 21
exp_base_level = 21
move_tags = [ "kittelly", "data", "artificial_electricity", "beast", "cat", "pet", "hands", "fast", "machine", "cool", "sound", "metal" ]
initial_moves = [ ExtResource( 5 ), ExtResource( 10 ), ExtResource( 13 ), ExtResource( 6 ), ExtResource( 9 ), ExtResource( 7 ), ExtResource( 16 ), ExtResource( 12 ) ]
tape_upgrades = [ ExtResource( 8 ), SubResource( 1 ), SubResource( 2 ), ExtResource( 20 ), ExtResource( 17 ) ]
unlock_ability = ""
fusion_name_prefix = "CAT-5_NAME_PREFIX"
fusion_name_suffix = "CAT-5_NAME_SUFFIX"
fusion_generator_path = "res://data/fusions/cat-5.tscn"
bestiary_index = 38
bestiary_category = 0
bestiary_bios = [ "CAT-5_LORE_1", "CAT-5_LORE_2" ]
bestiary_data_requirement = 0
bestiary_data_requirement_flag = ""
loot_table = ""
