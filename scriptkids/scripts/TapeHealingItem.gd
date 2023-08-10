extends BaseItem

export (int, 0, 100) var heal_percent:int = 100
export (AudioStream) var heal_sound:AudioStream
export (Array, Resource) var heal_vfx:Array

func get_use_options(_node, context_kind:int, context)->Array:
	if context_kind & ContextKind.CONTEXT_TAPE != 0:
		return [{
			"label":Loc.trf("ITEM_USE_ON_TAPE", [context.get_name()]), 
			"disabled": not _tape_filter(context), 
			"arg":{
				"tape":context, 
				"already_used":false
			}
		}]
	var result = [{"label":"ITEM_USE_ON_SUBMENU", "arg":null}]
	if context_kind == ContextKind.CONTEXT_BATTLE and can_heal_allies():
		
		for f in get_non_party_allies(context):
			result.push_back({
				"label":Loc.trgf("ITEM_USE_ON", f.get_pronouns(), [f.get_name_with_disambiguator()]), 
				"disabled":f.status.hp >= f.status.max_hp, 
				"arg":{
					"fighter":f, 
					"already_used":false
				}
			})
	return result

func can_heal_allies()->bool:
	return true

func get_non_party_allies(fighter):
	var result = []
	for f in fighter.battle.get_active_teams()[fighter.team]:
		if Character.is_human(f.get_character_kind()):
			continue
		var has_party_member = false
		for c in f.get_characters():
			if SaveState.party.characters.has(c.character):
				has_party_member = true
				break
		if not has_party_member:
			result.push_back(f)
	return result

func custom_use_menu(_node, context_kind:int, context, arg = null):
	if arg != null:
		return arg
	
	var tapes = SaveState.party.get_tapes()
	if context_kind == ContextKind.CONTEXT_BATTLE:
		tapes = tapes.duplicate()
		var battle = context.battle
		var i = 0
		for f in battle.get_teams(true, false)[context.team]:
			for c in f.get_characters():
				if c.current_tape in tapes:
					tapes.erase(c.current_tape)
					tapes.insert(i, c.current_tape)
					i += 1
				elif not f.status.dead and Character.is_human(c.character.character_kind):
					
					tapes.push_back(c.current_tape)
	
	return MenuHelper.show_choose_tape_menu(tapes, Bind.new(self, "_tape_filter"), Bind.new(self, "_tape_menu_callback", [context_kind, context]))

func _tape_filter(tape:MonsterTape)->bool:
	return not tape.is_broken() and tape.hp.compare(1) < 0

func _tape_menu_callback(context_kind:int, context, tape:MonsterTape, button:Control):
	var use_in_menu:bool = true
	var use_on_fighter:Node = null
	
	if context_kind == ContextKind.CONTEXT_BATTLE:
		
		for f in context.battle.get_active_teams()[context.team]:
			if _is_using_tape(f, tape):
				
				use_in_menu = false
				use_on_fighter = f
				break
	
	if use_in_menu:
		var co = _heal_tape(tape, button)
		if co is GDScriptFunctionState:
			yield (co, "completed")
	
	return {
		tape = tape, 
		fighter = use_on_fighter, 
		already_used = use_in_menu
	}

func _is_using_tape(fighter, tape:MonsterTape)->bool:
	for c in fighter.get_characters():
		if c.active_tape == tape:
			return true
	return false

func _use_in_world(_node, _context, arg):
	if arg.already_used:
		
		return true
	
	
	_heal_tape(arg.tape)
	return true

func _use_in_battle(_node, fighter, arg):
	if arg == null:
		
		fighter.get_controller().heal(heal_percent * fighter.status.max_hp / 100)
		return true
	
	elif not arg.already_used:
		assert (arg.has("fighter"))
		for c in arg.fighter.get_characters():
			if c.active_tape:
				_heal_tape(c.active_tape)
		arg.fighter.status.refresh_stats()
		arg.fighter.battle.queue_animation(Bind.new(self, "_animate_on_fighter", [arg.fighter, arg.fighter.status.get_snapshot()]))
		return true
	
	assert (arg.already_used)
	return true

func _animate_on_fighter(fighter, snapshot):
	var co_list = []
	if fighter.status_bubble:
		co_list.push_back(fighter.status_bubble.set_snapshot(snapshot))
	if heal_vfx.size() > 0:
		co_list.push_back(fighter.animate_vfx_sequence(heal_vfx))
	return Co.join(co_list)

func _heal_tape(tape:MonsterTape, tape_button:Control = null):
	var hp = tape.hp.add(heal_percent, 100).min_with(1)
	if tape_button:
		var co = tape_button.rewind_tape_to(hp, heal_sound)
		if co is GDScriptFunctionState:
			yield (co, "completed")
	else :
		tape.hp.set_to(hp.numerator, hp.denominator)

