GDPC                                                                            	   1   res://mods/Signature Status Pombomb/metadata.tres      �                      %   res://data/monster_forms/pombomb.tres�      �                      '   res://data/monster_forms/spitzfyre.tres�                            0   res://data/battle_moves/Nyoomies_Boondoggle.tres�&                            ,   res://data/battle_moves/Nyoomies_Dogged.tres�,      Z                      -   res://data/battle_moves/Nyoomies_Fakeout.tres3      �                      +   res://data/attack_vfx/nyoomies_fakeout.tres�9      n                      '   res://data/attack_vfx/nyoomies_jam.tres<                            (   res://data/attack_vfx/nyoomies_slam.tres?      �                      [gd_resource type="Resource" load_steps=2 format=2]

[ext_resource path="res://data/ContentInfo.gd" type="Script" id=1]

[resource]
script = ExtResource( 1 )
id = "test1"
name = "Unnamed Mod"
version_code = 0
version_string = "1.0"
author = ""
save_file_format_tag = ""
save_file_format_tag_version = 0
network_protocol_tag = ""
modified_files = [ "res://data/monster_forms/pombomb.tres", "res://data/monster_forms/spitzfyre.tres", "res://data/battle_moves/Nyoomies_Boondoggle.tres", "res://data/battle_moves/Nyoomies_Dogged.tres", "res://data/battle_moves/Nyoomies_Fakeout.tres", "res://data/attack_vfx/nyoomies_fakeout.tres", "res://data/attack_vfx/nyoomies_jam.tres", "res://data/attack_vfx/nyoomies_slam.tres" ]
modified_dirs = [  ]
[gd_resource type="Resource" load_steps=22 format=2]

[ext_resource path="res://sfx/cries/pombomb_cry.wav" type="AudioStream" id=1]
[ext_resource path="res://data/battle_moves/Nyoomies_Fakeout.tres" type="Resource" id=2]
[ext_resource path="res://data/elemental_types/fire.tres" type="Resource" id=3]
[ext_resource path="res://data/monster_forms/spitzfyre.tres" type="Resource" id=5]
[ext_resource path="res://data/battle_moves/spit.tres" type="Resource" id=6]
[ext_resource path="res://data/battle_moves/dog_years.tres" type="Resource" id=7]
[ext_resource path="res://data/battle_moves/inflame.tres" type="Resource" id=8]
[ext_resource path="res://data/battle_moves/elemental_wall.tres" type="Resource" id=9]
[ext_resource path="res://data/battle_moves/zoomies.tres" type="Resource" id=10]
[ext_resource path="res://data/battle_moves/be_random.tres" type="Resource" id=11]
[ext_resource path="res://data/tape_upgrade_scripts/TapeUpgradeMove.gd" type="Script" id=12]
[ext_resource path="res://data/battle_moves/hot_potato.tres" type="Resource" id=13]
[ext_resource path="res://data/battle_moves/sticky_tongue.tres" type="Resource" id=14]
[ext_resource path="res://data/MonsterForm.gd" type="Script" id=15]
[ext_resource path="res://ui/monster_stickers/pombomb.png" type="Texture" id=16]
[ext_resource path="res://data/Evolution.gd" type="Script" id=17]

[sub_resource type="Resource" id=1]
resource_name = "spitzfyre"
script = ExtResource( 17 )
evolved_form = ExtResource( 5 )
required_tape_grade = 5
min_hour = 0.0
max_hour = 24.0
required_location = ""
specialization = ""
is_secret = false

[sub_resource type="Resource" id=2]
resource_name = "Slot + inflame"
script = ExtResource( 12 )
add_slot = true
sticker = ExtResource( 8 )

[sub_resource type="Resource" id=3]
resource_name = "Slot + zoomies"
script = ExtResource( 12 )
add_slot = true
sticker = ExtResource( 10 )

[sub_resource type="Resource" id=4]
resource_name = "elemental_wall"
script = ExtResource( 12 )
add_slot = false
sticker = ExtResource( 9 )

[sub_resource type="Resource" id=5]
resource_name = "be_random"
script = ExtResource( 12 )
add_slot = false
sticker = ExtResource( 11 )

[resource]
script = ExtResource( 15 )
name = "POMBOMB_NAME"
swap_colors = [ Color( 0.0901961, 0.0901961, 0.207843, 1 ), Color( 0.152941, 0.160784, 0.309804, 1 ), Color( 0.215686, 0.247059, 0.403922, 1 ), Color( 0.341176, 0.384314, 0.556863, 1 ), Color( 0.513726, 0.564706, 0.72549, 1 ), Color( 0.470588, 0.14902, 0.14902, 1 ), Color( 0.611765, 0.290196, 0.207843, 1 ), Color( 0.85098, 0.541176, 0.188235, 1 ), Color( 0.945098, 0.760784, 0.333333, 1 ), Color( 0.972549, 0.901961, 0.545098, 1 ), Color( 0.286275, 0.0941176, 0.0941176, 1 ), Color( 0.439216, 0.160784, 0.141176, 1 ), Color( 0.815686, 0.301961, 0.184314, 1 ), Color( 0.94902, 0.509804, 0.270588, 1 ), Color( 0.968627, 0.764706, 0.431373, 1 ) ]
default_palette = [  ]
emission_palette = [  ]
battle_cry = ExtResource( 1 )
named_positions = {
"attack": Vector2( 43, 22 ),
"decoy": Vector2( 55, 47 ),
"eye": Vector2( 35, 19 ),
"hit": Vector2( 44, 19 )
}
elemental_types = [ ExtResource( 3 ) ]
tape_sticker_texture = ExtResource( 16 )
exp_yield = 40
require_dlc = ""
battle_sprite_path = "res://sprites/monsters/pombomb.json"
ui_sprite_path = ""
pronouns = 0
description = "POMBOMB_DESCRIPTION"
max_hp = 100
melee_attack = 90
melee_defense = 90
ranged_attack = 100
ranged_defense = 120
speed = 100
accuracy = 100
evasion = 100
max_ap = 6
move_slots = 6
evolutions = [ SubResource( 1 ) ]
evolution_specialization_question = ""
capture_rate = 30
exp_gradient = 21
exp_base_level = 0
move_tags = [ "pombomb", "dog", "cute", "pet", "animal", "annoy", "bone", "bomb", "tongue" ]
initial_moves = [ ExtResource( 6 ), ExtResource( 7 ), ExtResource( 14 ), ExtResource( 2 ) ]
tape_upgrades = [ SubResource( 2 ), SubResource( 3 ), ExtResource( 13 ), SubResource( 4 ), SubResource( 5 ) ]
unlock_ability = ""
fusion_name_prefix = "POMBOMB_NAME_PREFIX"
fusion_name_suffix = "POMBOMB_NAME_SUFFIX"
fusion_generator_path = "res://data/fusions/pombomb.tscn"
bestiary_index = 104
bestiary_category = 0
bestiary_bios = [ "POMBOMB_LORE_1", "POMBOMB_LORE_2" ]
bestiary_data_requirement = 0
bestiary_data_requirement_flag = ""
loot_table = ""
[gd_resource type="Resource" load_steps=22 format=2]

[ext_resource path="res://data/MonsterForm.gd" type="Script" id=1]
[ext_resource path="res://data/elemental_types/fire.tres" type="Resource" id=2]
[ext_resource path="res://ui/monster_stickers/spitzfyre.png" type="Texture" id=3]
[ext_resource path="res://data/battle_moves/inflame.tres" type="Resource" id=6]
[ext_resource path="res://data/battle_moves/elemental_wall.tres" type="Resource" id=7]
[ext_resource path="res://data/battle_moves/zoomies.tres" type="Resource" id=8]
[ext_resource path="res://data/battle_moves/be_random.tres" type="Resource" id=9]
[ext_resource path="res://data/battle_moves/spit.tres" type="Resource" id=10]
[ext_resource path="res://data/battle_moves/dog_years.tres" type="Resource" id=11]
[ext_resource path="res://data/battle_moves/sure_fire.tres" type="Resource" id=12]
[ext_resource path="res://data/battle_moves/hot_potato.tres" type="Resource" id=13]
[ext_resource path="res://data/battle_moves/glitter_bomb.tres" type="Resource" id=14]
[ext_resource path="res://data/battle_moves/sonic_boom.tres" type="Resource" id=15]
[ext_resource path="res://data/tape_upgrade_scripts/TapeUpgradeMove.gd" type="Script" id=16]
[ext_resource path="res://data/battle_moves/air_wall.tres" type="Resource" id=17]
[ext_resource path="res://sfx/cries/spitzfyre_cry.wav" type="AudioStream" id=18]
[ext_resource path="res://data/battle_moves/rapid_fire.tres" type="Resource" id=19]
[ext_resource path="res://data/battle_moves/sticky_tongue.tres" type="Resource" id=20]

[sub_resource type="Resource" id=1]
resource_name = "sure_fire"
script = ExtResource( 16 )
add_slot = false
sticker = ExtResource( 12 )

[sub_resource type="Resource" id=2]
resource_name = "glitter_bomb"
script = ExtResource( 16 )
add_slot = false
sticker = ExtResource( 14 )

[sub_resource type="Resource" id=3]
resource_name = "sonic_boom"
script = ExtResource( 16 )
add_slot = false
sticker = ExtResource( 15 )

[resource]
script = ExtResource( 1 )
name = "SPITZFYRE_NAME"
swap_colors = [ Color( 0.0901961, 0.0901961, 0.207843, 1 ), Color( 0.152941, 0.160784, 0.309804, 1 ), Color( 0.215686, 0.247059, 0.403922, 1 ), Color( 0.341176, 0.384314, 0.556863, 1 ), Color( 0.513726, 0.564706, 0.72549, 1 ), Color( 0.470588, 0.14902, 0.14902, 1 ), Color( 0.611765, 0.290196, 0.207843, 1 ), Color( 0.85098, 0.541176, 0.188235, 1 ), Color( 0.945098, 0.760784, 0.333333, 1 ), Color( 0.972549, 0.901961, 0.545098, 1 ), Color( 0.207843, 0.133333, 0.164706, 1 ), Color( 0.278431, 0.164706, 0.207843, 1 ), Color( 0.435294, 0.223529, 0.270588, 1 ), Color( 0.576471, 0.32549, 0.32549, 1 ), Color( 0.74902, 0.505882, 0.470588, 1 ) ]
default_palette = [  ]
emission_palette = [  ]
battle_cry = ExtResource( 18 )
named_positions = {
"attack": Vector2( 59, 20 ),
"decoy": Vector2( 72, 50 ),
"eye": Vector2( 52, 16 ),
"hit": Vector2( 54, 23 )
}
elemental_types = [ ExtResource( 2 ) ]
tape_sticker_texture = ExtResource( 3 )
exp_yield = 40
require_dlc = ""
battle_sprite_path = "res://sprites/monsters/spitzfyre.json"
ui_sprite_path = ""
pronouns = 0
description = "SPITZFYRE_DESCRIPTION"
max_hp = 120
melee_attack = 100
melee_defense = 100
ranged_attack = 160
ranged_defense = 140
speed = 140
accuracy = 100
evasion = 100
max_ap = 10
move_slots = 8
evolutions = [  ]
evolution_specialization_question = ""
capture_rate = 15
exp_gradient = 21
exp_base_level = 21
move_tags = [ "pombomb", "dog", "cute", "pet", "animal", "annoy", "bone", "bomb", "flight", "tongue" ]
initial_moves = [ ExtResource( 10 ), ExtResource( 11 ), ExtResource( 20 ), ExtResource( 6 ), ExtResource( 8 ), ExtResource( 13 ), ExtResource( 7 ), ExtResource( 9 ) ]
tape_upgrades = [ SubResource( 1 ), ExtResource( 19 ), SubResource( 2 ), ExtResource( 17 ), SubResource( 3 ) ]
unlock_ability = ""
fusion_name_prefix = "SPITZFYRE_NAME_PREFIX"
fusion_name_suffix = "SPITZFYRE_NAME_SUFFIX"
fusion_generator_path = "res://data/fusions/spitzfyre.tscn"
bestiary_index = 105
bestiary_category = 0
bestiary_bios = [ "SPITZFYRE_LORE_1", "SPITZFYRE_LORE_2" ]
bestiary_data_requirement = 0
bestiary_data_requirement_flag = ""
loot_table = ""
[gd_resource type="Resource" load_steps=6 format=2]

[ext_resource path="res://data/battle_move_scripts/PureStatus.gd" type="Script" id=1]
[ext_resource path="res://data/status_effects/flinch.tres" type="Resource" id=2]
[ext_resource path="res://data/elemental_types/beast.tres" type="Resource" id=3]
[ext_resource path="res://data/attack_vfx/nyoomies_jam.tres" type="Resource" id=4]
[ext_resource path="res://data/sticker_attribute_profiles/status.tres" type="Resource" id=5]

[resource]
script = ExtResource( 1 )
name = "Boondoggle"
category_name = "MOVE_CATEGORY_STATUS"
description = "Vacantly waste everyone's time."
title_override = ""
tags = [ "pombomb", "unsellable" ]
priority = 0
cost = 5
is_debug = false
is_passive_only = false
power = 0
physicality = 1
target_type = 3
default_target = 0
elemental_types = [ ExtResource( 3 ) ]
accuracy = 100
unavoidable = true
crit_rate_numerator = 1
crit_rate_denominator = 16
crit_damage_percent = 150
play_attack_animation = true
fade_lights_during_attack = false
windup_animation = "windup"
attack_animation = "attack"
windup_sfx_override = [  ]
attack_vfx = [ ExtResource( 4 ) ]
play_attack_vfx_against_allies = true
attack_duration = 0.0
hit_vfx = [  ]
hit_delay = 0.0
disable_melee_movement = false
can_be_copied = true
attribute_profile = ExtResource( 5 )
camera_state_override = ""
status_effects = [ ExtResource( 2 ) ]
amount = 1
varied_amounts = [  ]
status_effects_to_apply = 0
num_at_random = 1
fail_if_already_present = false
fail_against_archangels = false
fail_if_has_tag = ""
sacrifice_hp_percent = 0
[gd_resource type="Resource" load_steps=6 format=2]

[ext_resource path="res://data/battle_move_scripts/GenericAttack.gd" type="Script" id=1]
[ext_resource path="res://data/hit_vfx/hit.tres" type="Resource" id=2]
[ext_resource path="res://data/status_effects/ap_boost.tres" type="Resource" id=3]
[ext_resource path="res://data/elemental_types/ice.tres" type="Resource" id=4]
[ext_resource path="res://data/attack_vfx/nyoomies_slam.tres" type="Resource" id=5]

[resource]
script = ExtResource( 1 )
name = "Dogged"
category_name = "MOVE_CATEGORY_MELEE"
description = "Hits one target. Boosts the user's AP generation."
title_override = ""
tags = [ "pombomb", "unsellable" ]
priority = 0
cost = 3
is_debug = false
is_passive_only = false
power = 60
physicality = 0
target_type = 1
default_target = 3
elemental_types = [ ExtResource( 4 ) ]
accuracy = 100
unavoidable = false
crit_rate_numerator = 1
crit_rate_denominator = 16
crit_damage_percent = 150
play_attack_animation = true
fade_lights_during_attack = false
windup_animation = "windup"
attack_animation = "attack"
windup_sfx_override = [  ]
attack_vfx = [ ExtResource( 5 ) ]
play_attack_vfx_against_allies = false
attack_duration = 0.2
hit_vfx = [ ExtResource( 2 ) ]
hit_delay = 0.0
disable_melee_movement = false
can_be_copied = true
camera_state_override = ""
min_hits = 1
max_hits = 1
target_status_effects = [  ]
user_status_effects = [ ExtResource( 3 ) ]
status_effects_to_apply = 0
status_effect_amount = 3
status_effect_chance = 100
status_effect_only_for_target_types = [  ]
target_status_only_if_not_had_turn = false
destroys_walls = false
require_target_tag = ""
[gd_resource type="Resource" load_steps=5 format=2]

[ext_resource path="res://data/attack_vfx/nyoomies_fakeout.tres" type="Resource" id=1]
[ext_resource path="res://data/hit_vfx/hit.tres" type="Resource" id=2]
[ext_resource path="res://data/battle_move_scripts/AltStatAttack.gd" type="Script" id=3]
[ext_resource path="res://data/sticker_attribute_profiles/attack.tres" type="Resource" id=4]

[resource]
script = ExtResource( 3 )
name = "Fakeout"
category_name = "MOVE_CATEGORY_MELEE"
description = "Hits one target. Uses the user’s Ranged Attack stat instead of Melee Attack."
title_override = ""
tags = [ "pombomb", "unsellable" ]
priority = 0
cost = 2
is_debug = false
is_passive_only = false
power = 60
physicality = 0
target_type = 1
default_target = 3
elemental_types = [  ]
accuracy = 120
unavoidable = false
crit_rate_numerator = 1
crit_rate_denominator = 16
crit_damage_percent = 150
play_attack_animation = true
fade_lights_during_attack = false
windup_animation = "windup"
attack_animation = "attack"
windup_sfx_override = [  ]
attack_vfx = [ ExtResource( 1 ) ]
play_attack_vfx_against_allies = false
attack_duration = 0.0
hit_vfx = [ ExtResource( 2 ) ]
hit_delay = 0.0
disable_melee_movement = false
can_be_copied = true
attribute_profile = ExtResource( 4 )
camera_state_override = ""
min_hits = 1
max_hits = 1
target_status_effects = [  ]
user_status_effects = [  ]
status_effects_to_apply = 0
status_effect_amount = 3
status_effect_chance = 0
status_effect_only_for_target_types = [  ]
target_status_only_if_not_had_turn = false
destroys_walls = false
require_target_tag = ""
attack_stat = "melee_attack"[gd_resource type="Resource" load_steps=3 format=2]

[ext_resource path="res://data/battle_vfx_scripts/SlotAnimVfx.gd" type="Script" id=1]
[ext_resource path="res://sfx/attacks/dodge.wav" type="AudioStream" id=2]

[resource]
script = ExtResource( 1 )
initial_delay = 0.0
sound = ExtResource( 2 )
sound_pitch_scale = 1.0
sound_random_pitch = 1.1
background_lighting = 1.0
background_lighting_ease_duration = 0.5
origin_anchor_name = "attack"
target_anchor_name = "hit"
origin_anchor_on_ground = false
target_anchor_on_ground = false
play_form_sound = ""
animation_name = "dodge"
random_seek = false
play_on_targets = false
[gd_resource type="Resource" load_steps=5 format=2]

[ext_resource path="res://data/battle_vfx_scripts/ParallelVfx.gd" type="Script" id=1]
[ext_resource path="res://data/attack_vfx/traffic_light_cone.tres" type="Resource" id=2]
[ext_resource path="res://data/attack_vfx/traffic_jam_light.tres" type="Resource" id=3]
[ext_resource path="res://sfx/attacks/traffic_jam.wav" type="AudioStream" id=4]

[resource]
script = ExtResource( 1 )
initial_delay = 0.0
sound = ExtResource( 4 )
sound_pitch_scale = 1.0
sound_random_pitch = 1.1
background_lighting = 0.3
background_lighting_ease_duration = 0.3
origin_anchor_name = "attack"
target_anchor_name = "hit"
origin_anchor_on_ground = true
target_anchor_on_ground = false
play_form_sound = ""
vfx = [ ExtResource( 3 ), ExtResource( 2 ) ]
[gd_resource type="Resource" load_steps=4 format=2]

[ext_resource path="res://data/battle_vfx_scripts/SceneVfx.gd" type="Script" id=1]
[ext_resource path="res://sprites/vfx/particles/morgante_attack_orange.tscn" type="PackedScene" id=2]
[ext_resource path="res://sfx/attacks/morgante_attack.wav" type="AudioStream" id=3]

[resource]
script = ExtResource( 1 )
initial_delay = 0.0
sound = ExtResource( 3 )
sound_pitch_scale = 1.0
sound_random_pitch = 1.1
background_lighting = 0.3
background_lighting_ease_duration = 0.1
origin_anchor_name = "attack"
target_anchor_name = "hit"
origin_anchor_on_ground = false
target_anchor_on_ground = false
scene = ExtResource( 2 )
enable_flip = true
duration = 0.5
offset = Vector3( 0, 0, 0 )
spawn_at_target = false
