extends BaseItem

func _use_in_world(_node, _context, _character):


	SaveState.set_flag("HouseWest3_fridge", false)
	return true


```
func _use_in_world(_node, _context, character):
	character.exp_points = 0
	character.level -=1
	return true

```
[node name="Cutscene" type="Node"]
script = ExtResource( 1 )
require_partner_id = "eugene"
min_partner_relationship_level = 4
max_partner_relationship_level = 4
require_partner_ready_for_relationship_level_up = true
require_scene_path = "Gramophone"
priority = 100
```

func get_use_options(node, context_kind:int, context)->Array:
	if context_kind == ContextKind.CONTEXT_WORLD:
		var result = []
		var characters = SaveState.party.characters
		for character in characters:
			if character.partner_id != "" and not SaveState.party.is_partner_unlocked(character.partner_id):
				continue
			result.push_back({
				"label":Loc.trgf("ITEM_USE_ON", character.pronouns, [character.name]), 
				"disabled":character.level >= Character.MAX_LEVEL, 
				"arg":character
			})
		return result
	return .get_use_options(node, context_kind, context)

func _use_in_world(_node, _context, character):
	yield (MenuHelper.level_up(character), "completed")
	return true

```
func get_use_options(_node, _context_kind:int, _context)->Array:
	return [{"label":"ITEM_READ", "arg":null}]

func custom_use_menu(_node, _context_kind:int, _context, _arg = null):
	yield (show_tutorials(), "completed")
	
	if not SaveState.inventory.has_item(TypeChart):
		GlobalMessageDialog.clear_state()
		yield (GlobalMessageDialog.show_message("ITEM_TUTORIAL_GIVE_TYPE_CHART"), "completed")
		
		yield (MenuHelper.give_item(TypeChart, 1, false), "completed")

```
func notify(fighter, id:String, args):
	if id == "attack_damage_ending" and args.target == fighter: