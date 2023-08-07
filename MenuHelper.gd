extends CanvasLayer

signal map_shown
signal top_menu_changed(top_menu)

var ability_cutscenes:Dictionary
var tutorials:Dictionary
var scenes:Dictionary

var _current_top:Node
var hud:Control
var sys_layer:CanvasLayer

func _ready():
	pause_mode = Node.PAUSE_MODE_PROCESS
	layer = 33
	sys_layer = CanvasLayer.new()
	sys_layer.name = "SysLayer"
	sys_layer.layer = 34
	add_child(sys_layer)
	SceneManager.connect("quitting", self, "clear")
	SceneManager.connect("pushing_state", self, "stash_state")
	SceneManager.connect("popping_state", self, "restore_state")
	SceneManager.connect("freeing_state", self, "free_state")

func setup():
	ability_cutscenes = {
		"glide":load("res://cutscenes/abilities/Glide.tscn"), 
		"swim":load("res://cutscenes/abilities/Swim.tscn"), 
		"climb":load("res://cutscenes/abilities/Climb.tscn"), 
		"dash":load("res://cutscenes/abilities/Dash.tscn"), 
		"magnetism":load("res://cutscenes/abilities/Magnetism.tscn"), 
		"flight":load("res://cutscenes/abilities/Flight.tscn"), 
	}
	tutorials = {
		ap = {
			title = "TUTORIAL_AP_TITLE", 
			pages = [
				load("res://menus/tutorial_box/TutorialAP1.tscn"), 
				load("res://menus/tutorial_box/TutorialAP2.tscn")
			]
		}, 
		recording = {
			title = "TUTORIAL_RECORDING_TITLE", 
			pages = [
				load("res://menus/tutorial_box/TutorialRecording1.tscn"), 
				load("res://menus/tutorial_box/TutorialRecording2.tscn")
			]
		}, 
		tape_storage = {
			title = "TUTORIAL_TAPE_STORAGE_TITLE", 
			pages = [
				load("res://menus/tutorial_box/TutorialTapeStorage.tscn")
			]
		}, 
		stickers = {
			title = "TUTORIAL_STICKERS_TITLE", 
			pages = [
				load("res://menus/tutorial_box/TutorialStickers1.tscn"), 
				load("res://menus/tutorial_box/TutorialStickers2.tscn")
			]
		}, 
		fusion = {
			title = "TUTORIAL_FUSION_TITLE", 
			pages = [
				load("res://menus/tutorial_box/TutorialFusion1.tscn"), 
				load("res://menus/tutorial_box/TutorialFusion2.tscn")
			]
		}, 
		relationships = {
			title = "TUTORIAL_RELATIONSHIPS_TITLE", 
			pages = [
				load("res://menus/tutorial_box/TutorialRelationships.tscn")
			]
		}, 
		remaster = {
			title = "TUTORIAL_REMASTER_TITLE", 
			pages = [
				load("res://menus/tutorial_box/TutorialRemaster.tscn")
			]
		}, 
		rumors = {
			title = "TUTORIAL_RUMORS_TITLE", 
			pages = [
				load("res://menus/tutorial_box/TutorialRumors1.tscn"), 
				load("res://menus/tutorial_box/TutorialRumors2.tscn")
			]
		}, 
		stations = {
			title = "TUTORIAL_STATIONS_TITLE", 
			pages = [
				load("res://menus/tutorial_box/TutorialStations1.tscn"), 
				load("res://menus/tutorial_box/TutorialStations2.tscn")
			]
		}, 
		archangel_ap = {
			title = "TUTORIAL_ARCHANGEL_AP_TITLE", 
			pages = [
				load("res://menus/tutorial_box/TutorialArchangelAP.tscn")
			]
		}, 
		rogue_fusions = {
			title = "TUTORIAL_ROGUE_FUSIONS_TITLE", 
			pages = [
				load("res://menus/tutorial_box/TutorialRogueFusions1.tscn"), 
				load("res://menus/tutorial_box/TutorialRogueFusions2.tscn")
			]
		}
	}
	
	scenes.InventoryMenu = load("res://menus/inventory/InventoryMenu.tscn")
	scenes.PartyTapeMenu = load("res://menus/party_tape/PartyTapeMenu.tscn")
	scenes.TapeStorageMenu = load("res://menus/tape_storage/TapeStorageMenu.tscn")
	scenes.PartyMenu = load("res://menus/party/PartyMenu.tscn")
	scenes.ChooseTapeMenu = load("res://menus/choose_tape/ChooseTapeMenu.tscn")
	scenes.GainExpMenu = load("res://menus/gain_exp/GainExpMenu.tscn")
	scenes.ExchangeMenu = load("res://menus/exchange/ExchangeMenu.tscn")
	scenes.MapPauseMenu = load("res://menus/map_pause/MapPauseMenu.tscn")
	scenes.MapMenu = load("res://menus/map_pause/MapMenu.tscn")
	scenes.BestiaryMenu = load("res://menus/bestiary/BestiaryMenu.tscn")
	scenes.CampingMenu = load("res://menus/camping/CampingMenu.tscn")
	scenes.EvolutionMenu = load("res://menus/evolution/EvolutionMenu.tscn")
	scenes.TextInputMenu = load("res://menus/text_input/TextInputMenu.tscn")
	scenes.SpookyDialog = load("res://menus/spooky_dialog/SpookyDialog.tscn")
	scenes.CharacterCreationMenu = load("res://menus/character_creation/CharacterCreationMenu.tscn")
	scenes.GiveTapeMenu = load("res://menus/give_tape/GiveTapeMenu.tscn")
	scenes.LootMenu = load("res://menus/loot/LootMenu.tscn")
	scenes.DroppedMenu = load("res://menus/loot/DroppedMenu.tscn")
	scenes.NewQuestBanner = load("res://menus/new_quest/NewQuestBanner.tscn")
	scenes.QuestUpdateBanner = load("res://menus/new_quest/QuestUpdateBanner.tscn")
	scenes.QuestCompleteBanner = load("res://menus/quest_complete/QuestCompleteBanner.tscn")
	scenes.Illustration = load("res://menus/illustration/Illustration.tscn")
	scenes.StatAdjustMenu = load("res://menus/stat_adjust/StatAdjustMenu.tscn")
	scenes.RangerStampCardMenu = load("res://menus/ranger_stamp_card/RangerStampCardMenu.tscn")
	scenes.QuestLogMenu = load("res://menus/quest_log/QuestLogMenu.tscn")
	scenes.NoticeboardMenu = load("res://menus/noticeboard/NoticeboardMenu.tscn")
	scenes.TutorialBox = load("res://menus/tutorial_box/TutorialBox.tscn")
	scenes.SettingsMenu = load("res://menus/settings/SettingsMenu.tscn")
	
	
	hud = load("res://world/ui/WorldUIOverlay.tscn").instance()
	hud.name = "WorldUIOverlay"
	add_child(hud, true)

func clear():
	for child in get_children():
		if child != hud and child != sys_layer:
			remove_child(child)
			child.queue_free()

func stash_state(state):
	state.menus = []
	for child in get_children():
		if child != hud and child != sys_layer:
			if not child.is_queued_for_deletion():
				state.menus.push_back(child)
			remove_child(child)

func restore_state(state):
	for menu in state.menus:
		add_child(menu)

func free_state(state):
	for menu in state.menus:
		menu.queue_free()

func get_top_menu()->Node:
	if GlobalMenuDialog.visible and GlobalMenuDialog.menu.visible:
		return GlobalMenuDialog.menu
	if GlobalMessageDialog.visible and GlobalMessageDialog.message_dialog.visible:
		return GlobalMessageDialog.message_dialog
	for i in range(sys_layer.get_child_count() - 1, - 1, - 1):
		var child = sys_layer.get_child(i)
		if child.get("visible"):
			return child
	for i in range(get_child_count() - 1, - 1, - 1):
		var child = get_child(i)
		if child != hud and child != sys_layer and child.get("visible"):
			return child
	if SceneManager.current_scene is Control:
		return SceneManager.current_scene
	if WorldSystem.is_in_world():
		return hud
	return null

func is_in_top_menu(node:Node)->bool:
	var top = get_top_menu()
	if top:
		return node == top or top.is_a_parent_of(node)
	if SceneManager.current_scene:
		return node == SceneManager.current_scene or SceneManager.current_scene.is_a_parent_of(node)
	return false

func _process(_delta):
	if SceneManager.transitioning:
		return 
	
	var top_menu = get_top_menu()
	if top_menu and top_menu is Control and top_menu.visible and not top_menu.get_focus_owner():
		top_menu.focus_mode = Control.FOCUS_ALL
		top_menu.grab_focus()
	
	if top_menu != _current_top:
		_current_top = top_menu
		emit_signal("top_menu_changed", top_menu)

func party_character_use_item(character:Character):
	return _party_use_item(BaseItem.ContextKind.CONTEXT_CHARACTER, character)

func party_tape_use_item(tape:MonsterTape):
	return _party_use_item(BaseItem.ContextKind.CONTEXT_TAPE, tape)

func _party_use_item(context_kind:int, context):
	var inventory = scenes.InventoryMenu.instance()
	inventory.tab_filter = ["consumables"]
	inventory.context = context
	inventory.immediate_item_use = false
	add_child(inventory)
	var result = yield (inventory.run_menu(), "completed")
	if result != null:
		result.item.use(context_kind, context, result.arg)
	inventory.queue_free()

func party_check_tape(battle, tape:MonsterTape, tape_collection:Array, tape_switch_callback:Bind = null):
	var menu = scenes.PartyTapeMenu.instance()
	menu.battle = battle
	menu.tape = tape
	menu.tape_collection = tape_collection
	if tape_switch_callback:
		menu.connect("tape_switched", tape_switch_callback, "call_func2")
	add_child(menu)
	yield (menu.run_menu(), "completed")
	menu.queue_free()

func party_apply_sticker_to_tape(tape:MonsterTape, sticker:StickerItem):
	var menu = scenes.PartyTapeMenu.instance()
	menu.applying_sticker = sticker
	menu.tape = tape
	add_child(menu)
	var result = yield (menu.run_menu(), "completed")
	menu.queue_free()
	return result

func show_trade_tape(tape:MonsterTape, tape_collection:Array):
	var menu = scenes.PartyTapeMenu.instance()
	menu.is_trade = true
	menu.tape = tape
	menu.tape_collection = tape_collection
	add_child(menu)
	yield (menu.run_menu(), "completed")
	menu.queue_free()

func show_tape_storage(trading_remote_id = null):
	var menu = scenes.TapeStorageMenu.instance()
	menu.trading_remote_id = trading_remote_id
	add_child(menu)
	var result = yield (menu.run_menu(), "completed")
	menu.queue_free()
	return result

func show_party(battle = null, camping:bool = false):
	var menu = scenes.PartyMenu.instance()
	menu.battle = battle
	menu.camping = camping
	add_child(menu)
	yield (menu.run_menu(), "completed")
	menu.queue_free()

func show_choose_tape_menu(tapes:Array = [], filter:Bind = null, callback:Bind = null):
	var menu = scenes.ChooseTapeMenu.instance()
	menu.tapes = tapes
	menu.filter = filter
	menu.callback = callback
	add_child(menu)
	var result = yield (menu.run_menu(), "completed")
	menu.queue_free()
	return result

func show_exp_screen(battle, exp_yield:int, loot_table:BaseLootTable, loot_rand:Random = null, extra_loot:Array = []):
	var menu = scenes.GainExpMenu.instance()
	menu.battle = battle
	menu.exp_yield = exp_yield
	if loot_table != null:
		menu.loot_table = loot_table
	if loot_rand != null:
		menu.loot_rand = loot_rand
	menu.extra_loot = extra_loot
	add_child(menu)
	yield (menu.run_menu(), "completed")
	menu.queue_free()

func level_up(character_or_tape:Resource):
	var exp_yield:int = 0
	if character_or_tape is Character:
		exp_yield = character_or_tape.get_exp_to_next_level()
	elif character_or_tape is MonsterTape:
		exp_yield = character_or_tape.get_exp_to_next_grade()
	
	var menu = scenes.GainExpMenu.instance()
	menu.whitelist = [character_or_tape]
	menu.exp_yield = exp_yield
	menu.loot_table = null
	add_child(menu)
	yield (menu.run_menu(), "completed")
	menu.queue_free()

func show_inventory(context = null, tab_filter = [], immediate_item_use = true):
	var menu = scenes.InventoryMenu.instance()
	menu.context = context
	menu.tab_filter = tab_filter
	menu.immediate_item_use = immediate_item_use
	add_child(menu)
	var result = yield (menu.run_menu(), "completed")
	menu.queue_free()
	return result

func show_exchange(title:String = "", exchanges = null, autosort:bool = true, discount_percent:int = 0):
	var menu = scenes.ExchangeMenu.instance()
	menu.autosort = autosort
	menu.discount_percent = discount_percent
	if title != "":
		menu.title = title
	if exchanges != null:
		menu.exchanges = exchanges
	add_child(menu)
	yield (menu.run_menu(), "completed")
	menu.queue_free()

func show_pause_menu(mode:int = 0):
	var menu = scenes.MapPauseMenu.instance()
	menu.mode = mode
	add_child(menu)
	yield (menu.run_menu(), "completed")
	menu.queue_free()
	emit_signal("map_shown")

func show_map_menu(enable_fast_travel:bool, highlight_chunks:Array = [], highlight_feature_name = "", map_metadata:MapMetadata = null, highlight_color = null):
	var menu = scenes.MapMenu.instance()
	if highlight_color != null:
		menu.highlight_color = highlight_color
	menu.enable_fast_travel = enable_fast_travel
	menu.highlight_chunks = highlight_chunks
	menu.highlight_feature_name = highlight_feature_name
	menu.map_metadata = map_metadata
	add_child(menu)
	var result = yield (menu.run_menu(), "completed")
	menu.queue_free()
	emit_signal("map_shown")
	return result

func show_map_menu_remote_player(player_id):
	var menu = scenes.MapMenu.instance()
	menu.enable_fast_travel = false
	menu.highlight_player_id = player_id
	add_child(menu)
	var result = yield (menu.run_menu(), "completed")
	menu.queue_free()
	emit_signal("map_shown")
	return result

func show_bestiary(enable_list:bool = true, initial_species:BaseForm = null, info_page:int = 0):
	var menu = scenes.BestiaryMenu.instance()
	menu.show_list = enable_list
	menu.species = initial_species
	menu.initial_info_page = info_page
	add_child(menu)
	yield (menu.run_menu(), "completed")
	menu.queue_free()

func show_camping_menu(resting_cost:int):
	var menu = scenes.CampingMenu.instance()
	menu.resting_cost = resting_cost
	add_child(menu)
	var result = yield (menu.run_menu(), "completed")
	menu.queue_free()
	return result

func show_evolution_menu(location:String):
	var menu = scenes.EvolutionMenu.instance()
	menu.location = location
	add_child(menu)
	yield (menu.run_menu(), "completed")
	menu.queue_free()

func confirm(message:String, default_index:int = 1, initial_index:int = 0):
	GlobalMessageDialog.clear_state()
	yield (GlobalMessageDialog.show_message(message, false, false), "completed")
	var result = yield (GlobalMenuDialog.show_menu(["UI_BUTTON_YES", "UI_BUTTON_NO"], default_index, initial_index), "completed")
	yield (GlobalMessageDialog.hide(), "completed")
	return result == 0

func show_text_input(title:String, default_text:String = "", max_length:int = 20, max_width:int = 0, convert_to_upper:bool = false, placeholder:String = ""):
	
	var menu = scenes.TextInputMenu.instance()
	menu.title = title
	menu.default_text = default_text
	menu.placeholder = placeholder
	menu.max_length = max_length
	menu.max_width = max_width
	menu.convert_to_upper = convert_to_upper
	add_child(menu)
	var result = yield (menu.run_menu(), "completed")
	menu.queue_free()
	assert (result == null or result is String)
	return result

func show_spooky_dialog(message:String, audio:AudioStream = null, type_sounds:Resource = null):
	var dialog = scenes.SpookyDialog.instance()
	dialog.text = message
	dialog.audio = audio
	dialog.type_sounds = type_sounds
	add_child(dialog)
	yield (dialog.run_menu(), "completed")
	dialog.queue_free()

func show_character_creation(character:Character, cancelable:bool, hidden_options:Array):
	var menu = scenes.CharacterCreationMenu.instance()
	menu.character = character
	menu.cancelable = cancelable
	menu.hidden_options = hidden_options
	add_child(menu)
	var result = yield (menu.run_menu(), "completed")
	menu.queue_free()
	return result

func give_tape(tape:MonsterTape, passive:bool, battle = null, add_tape:bool = true)->Dictionary:
	var is_new_species = not SaveState.species_collection.has_obtained_species(tape.form)
	var unlock_ability = ""
	if tape.form.unlock_ability != "" and not SaveState.has_ability(tape.form.unlock_ability):
		unlock_ability = tape.form.unlock_ability
	
	for i in range(tape.get_max_stickers()):
		var sticker = tape.get_sticker(i)
		if sticker:
			SaveState.inventory.notify_received_item(sticker, 1)
	
	var put_in_storage = false
	
	if add_tape:
		if SaveState.party.count_tapes() < SaveState.party.max_tapes:
			SaveState.party.add_tape(tape)
		else :
			SaveState.tape_collection.add_tape(tape)
			put_in_storage = true
	else :
		SaveState.species_collection.register(tape)
	
	var result = {
		put_in_storage = put_in_storage, 
		is_new_species = is_new_species, 
		unlock_ability = unlock_ability
	}
	
	if not passive:
		yield (show_give_tape(tape, battle, result), "completed")
	
	return result

func show_give_tape(tape:MonsterTape, battle = null, show_data:Dictionary = {}):
	var menu = scenes.GiveTapeMenu.instance()
	menu.tape = tape
	add_child(menu)
	yield (menu.run_menu(), "completed")
	menu.queue_free()
	
	Net.activity.obtained_tape(tape, battle != null)
	
	if show_data.get("is_new_species", false):
		yield (Co.next_frame(), "completed")
		yield (show_bestiary(false, tape.form), "completed")
	
	var put_in_storage = show_data.get("put_in_storage", false)
	
	if battle:
		
		yield (prompt_tutorial("recording"), "completed")
	
	if battle or SaveState.has_flag("tutorial_recording"):
		yield (party_check_tape(battle, tape, []), "completed")
	
	if put_in_storage:
		yield (prompt_tutorial("tape_storage"), "completed")
	
	var unlock_ability = show_data.get("unlock_ability", "")
	if unlock_ability != "" and SaveState.has_ability(unlock_ability):
		
		
		yield (play_ability_cutscene(unlock_ability), "completed")
	
	if put_in_storage:
		var message = Loc.trf("UI_PARTY_TAPE_WAS_PUT_AWAY", {
			"tape_name":tape.get_name()
		})
		GlobalMessageDialog.clear_state()
		yield (GlobalMessageDialog.show_message(message), "completed")

func play_ability_cutscene(ability:String):
	if not ability_cutscenes.has(ability):
		return Co.pass()
	var cutscene = ability_cutscenes[ability].instance()
	cutscene.blackboard.ability = tr("ABILITY_" + ability)
	add_child(cutscene)
	yield (cutscene.run(), "completed")
	remove_child(cutscene)
	cutscene.queue_free()

func give_item(item:BaseItem, amount:int, passive:bool):
	var left_over = SaveState.inventory.add_new_item(item, amount)
	var obtained = amount - left_over
	
	if left_over > 0:
		WorldSystem.drop_item(item, left_over)
	
	if passive:
		if obtained == 0 and amount > 0:
			GlobalMessageDialog.passive_message.show_message("ITEM_DROP_INVENTORY_FULL")
		elif obtained == 1:
			GlobalMessageDialog.passive_message.show_message(Loc.trf("ITEM_DROP_OBTAINED_ONE", [item.name]))
		else :
			GlobalMessageDialog.passive_message.show_message(Loc.trf("ITEM_DROP_OBTAINED_MULTIPLE", [item.name, obtained]))
	else :
		var records = []
		if obtained > 0:
			var loot = LootRecord.new()
			loot.item = item
			loot.amount = obtained
			records.push_back(loot)
		if left_over > 0:
			var loot = LootRecord.new()
			loot.item = item
			loot.amount = left_over
			loot.dropped = true
			records.push_back(loot)
		return show_loot(records)

func _stack_loot_records(items:Array)->Array:
	var result = []
	var dict = {}
	for item in items:
		var category = item.category if item.get("category") else ""
		if dict.has(category) and dict[category].has(item.item):
			dict[category][item.item].amount += item.amount
		else :
			var record = item.duplicate()
			result.push_back(record)
			if not dict.has(category):
				dict[category] = {}
			dict[category][item.item] = record
	return result

func give_items(items:Array, appends:Array = []):
	
	
	
	
	var records = []
	items = _stack_loot_records(items)
	for item in items:
		var left_over = SaveState.inventory.add_new_item(item.item, item.amount)
		var obtained = item.amount - left_over
		if left_over > 0:
			WorldSystem.drop_item(item.item, left_over)
		if obtained > 0:
			var loot = LootRecord.new()
			loot.item = item.item
			loot.amount = obtained
			if item.get("category"):
				loot.category = item.category
			records.push_back(loot)
		if left_over > 0:
			var loot = LootRecord.new()
			loot.item = item.item
			loot.amount = left_over
			loot.dropped = true
			records.push_back(loot)
	for record in appends:
		records.push_back(record)
	return show_loot(records)

func show_loot(items:Array):
	
	WorldSystem.push_flags(0)
	
	var menu = scenes.LootMenu.instance()
	menu.items = items
	add_child(menu)
	yield (menu.run_menu(), "completed")
	menu.queue_free()
	
	WorldSystem.pop_flags()

func consume_item(item:BaseItem, amount:int = 1, show_msg:bool = true)->bool:
	if SaveState.inventory.has_item(item, amount):
		var consumed = SaveState.inventory.consume_item(item, amount)
		assert (consumed == amount)
		if show_msg:
			var message:String
			if amount == 1:
				message = Loc.trf("ITEM_REMOVED_ONE", [item.name])
			else :
				message = Loc.trf("ITEM_REMOVED_MULTIPLE", [item.name, amount])
			GlobalMessageDialog.passive_message.show_message(message)
		return true
	return false

func drop_random_items():
	var resources = SaveState.inventory.get_category("resources")
	var items = []
	for item_node in resources.get_children():
		if item_node.is_discardable():
			var num = randi() % int(max(1, item_node.amount / 10))
			if num > 0:
				var rec = LootRecord.new()
				rec.item = item_node.item
				rec.amount = num
				rec.dropped = true
				items.push_back(rec)
				
				item_node.consume(num)
	
	if items.size() == 0:
		return Co.pass()
	
	WorldSystem.push_flags(0)
	
	var menu = scenes.DroppedMenu.instance()
	menu.items = items
	add_child(menu)
	yield (menu.run_menu(), "completed")
	menu.queue_free()
	
	WorldSystem.pop_flags()

func start_quest_banner(quest_node:Quest):
	var banner = scenes.NewQuestBanner.instance()
	banner.set_quest(quest_node)
	add_child(banner)
	yield (banner.run_menu(), "completed")
	banner.queue_free()
	return true

func start_quest(quest, params:Dictionary = {}):
	if quest == null:
		return false
	
	if SaveState.quests.has_quest(quest):
		var quest_node = SaveState.quests.get_quest(quest)
		if quest_node.get_quest_kind() != Quest.QuestKind.NORMAL:
			return true
		return start_quest_banner(quest_node)
	
	var quest_node:Quest = quest as Quest
	var quest_res:Resource = null
	if quest_node == null:
		quest_res = quest
		quest_node = quest.instance()
		if not quest_node.generate(params):
			quest_node.queue_free()
			return false
	else :
		quest_res = quest_node.get_resource()
	
	var co = SaveState.quests.start_quest(quest_node, params)
	if co is GDScriptFunctionState:
		yield (co, "completed")
	
	if quest_node.get_quest_kind() == Quest.QuestKind.NORMAL:
		yield (start_quest_banner(quest_node), "completed")
	elif quest_node.get_quest_kind() == Quest.QuestKind.RUMOR:
		yield (show_quest_log(quest_res), "completed")
	
	return true

func update_quest_banner(quest_node:Quest):
	if quest_node.get_quest_kind() != Quest.QuestKind.NORMAL:
		return true
	WorldSystem.push_flags(0)
	var banner = scenes.QuestUpdateBanner.instance()
	banner.set_quest(quest_node)
	add_child(banner)
	yield (banner.run_menu(), "completed")
	banner.queue_free()
	WorldSystem.pop_flags()
	return true

func update_quest(current_quest, new_quest, params:Dictionary = {}):
	if SaveState.quests.has_quest(new_quest):
		var quest_node = SaveState.quests.get_quest(new_quest)
		return update_quest_banner(quest_node)
	
	var quest_node:Quest = new_quest as Quest
	if quest_node == null:
		quest_node = new_quest.instance()
		if not quest_node.generate(params):
			quest_node.queue_free()
			return false
	
	var tracked = SaveState.quests.is_tracked(current_quest)
	if SaveState.quests.has_quest(current_quest):
		var co = SaveState.quests.complete_quest(current_quest, true)
		if co is GDScriptFunctionState:
			yield (co, "completed")
	
	var co = SaveState.quests.start_quest(quest_node, params)
	if co is GDScriptFunctionState:
		yield (co, "completed")
	
	if tracked:
		SaveState.quests.set_tracked(quest_node.get_resource(), true)
	
	yield (update_quest_banner(quest_node), "completed")
	
	return true

func complete_quest_banner(title:String):
	var banner = scenes.QuestCompleteBanner.instance()
	banner.set_title(title)
	add_child(banner)
	yield (banner.run_menu(), "completed")
	banner.queue_free()
	return true

func complete_quest(quest):
	if not SaveState.quests.has_quest(quest):
		assert (quest is Quest or quest is Resource)
		var quest_node:Quest = quest if quest is Quest else quest.instance()
		if quest_node.get_quest_kind() != Quest.QuestKind.NORMAL:
			if quest is Resource:
				quest_node.queue_free()
			return true
		WorldSystem.push_flags(0)
		SaveState.quests.complete_quest(quest_node)
		yield (complete_quest_banner(quest_node.title), "completed")
		WorldSystem.pop_flags()
		return true
	
	var quest_node = SaveState.quests.get_quest(quest)
	if quest_node.get_quest_kind() != Quest.QuestKind.NORMAL:
		SaveState.quests.complete_quest(quest_node)
		return true
	
	var title = quest_node.title
	var exp_yield = quest_node.get_exp_yield()
	var loot_table = quest_node.loot_table
	
	WorldSystem.push_flags(0)
		
	var co = SaveState.quests.complete_quest(quest_node)
	if co is GDScriptFunctionState:
		yield (co, "completed")
	quest_node = null
	
	yield (complete_quest_banner(title), "completed")
	
	if exp_yield > 0:
		yield (show_exp_screen(null, exp_yield, loot_table), "completed")
	
	WorldSystem.pop_flags()
	return true

func show_illustration(illustration:Resource, animation:int, audio:AudioStream, mute_music:bool):
	var menu = scenes.Illustration.instance()
	menu.illustration = illustration
	menu.animation = animation
	menu.audio = audio
	menu.mute_music = mute_music
	add_child(menu)
	yield (menu.run_menu(), "completed")
	menu.queue_free()

func show_boss_title_banner(title_banner:TitleBannerConfig):
	var menu = title_banner.instance()
	add_child(menu)
	yield (menu.play_animation(), "completed")
	menu.queue_free()

func save(screenshot:Image = null):
	GlobalMessageDialog.clear_state()
	yield (GlobalMessageDialog.show_message("UI_SAVING_MESSAGE", false, false), "completed")
	var result = SaveSystem.save(screenshot)
	if result is GDScriptFunctionState:
		result = yield (result, "completed")
	if not result:
		yield (GlobalMessageDialog.show_message("UI_SAVE_FAILED", true), "completed")
	else :
		yield (GlobalMessageDialog.show_message("UI_SAVE_COMPLETE", true), "completed")
	return result

func show_stat_adjust():
	var menu = scenes.StatAdjustMenu.instance()
	add_child(menu)
	yield (menu.run_menu(), "completed")
	menu.queue_free()

func show_ranger_stamp_card(animate_stamp_id:String = ""):
	var menu = scenes.RangerStampCardMenu.instance()
	menu.animate_stamp_id = animate_stamp_id
	add_child(menu)
	yield (menu.run_menu(), "completed")
	menu.queue_free()

func show_quest_log(quest = null):
	var menu = scenes.QuestLogMenu.instance()
	menu.initial_quest = quest
	add_child(menu)
	yield (menu.run_menu(), "completed")
	menu.queue_free()

func show_noticeboard():
	var menu = scenes.NoticeboardMenu.instance()
	add_child(menu)
	yield (menu.run_menu(), "completed")
	menu.queue_free()

func prompt_tutorial(id:String, force_co:bool = true):
	var flag = "tutorial_" + id
	if not SaveState.has_flag(flag):
		yield (show_tutorial(id), "completed")
	elif force_co:
		return Co.pass()

func show_tutorial(id:String):
	assert (tutorials.has(id))
	if not tutorials.has(id):
		return Co.pass()
	var tut = tutorials[id]
	yield (show_tutorial_box(tut.title, tut.pages), "completed")
	SaveState.set_flag("tutorial_" + id, true)

func show_tutorial_box(title:String, tutorials:Array):
	yield (GlobalMessageDialog.hide(), "completed")
	var menu = scenes.TutorialBox.instance()
	menu.title = title
	menu.tutorials = tutorials
	add_child(menu)
	yield (menu.run_menu(), "completed")
	menu.queue_free()

func show_settings():
	var menu = scenes.SettingsMenu.instance()
	add_child(menu)
	yield (menu.run_menu(), "completed")
	menu.queue_free()

func show_net_multiplayer_menu(_args:Dictionary = {}, _pause = false):
	return Co.pass()

func choose_tape_for_trade(remote_id):
	if yield (confirm("ONLINE_REQUEST_UI_TRADE_SAVE_WARNING"), "completed"):
		return yield (show_tape_storage(remote_id), "completed")
	return null
