extends BaseItem

func _use_in_world(_node, _context, _character):
	
	GlobalMessageDialog.clear_state()
	
	var partner = SaveState.party.partner

	var partner_id = SaveState.party.current_partner_id

	if partner_id == "kayleigh":
		
		if partner.relationship_level >= 3:
			
			if partner.relationship_kind == 2:
				
				SaveState.set_flag("player_has_romanced", false)
				SaveState.set_flag("player_romanced_kayleigh", false)
			
			partner.relationship_kind = 0
			partner.relationship_level -=1
			
			GlobalMessageDialog.show_message("What has been done has been undone [pause]for everyone but you.")
			
		else:
			GlobalMessageDialog.show_message("Some marks refuse to leave. Some things refuse to change.\n[pause]Some part of you will always remain.")
			return false
	else:
		
		if partner.relationship_level >= 2:
			
			if partner.relationship_kind == 2:
				
				SaveState.set_flag("player_has_romanced", false)
				
				if partner_id == "eugene":
					SaveState.set_flag("player_romanced_eugene", false)
				elif partner_id == "viola":
					SaveState.set_flag("player_romanced_viola", false)
				elif partner_id == "felix":
					SaveState.set_flag("player_romanced_felix", false)
				elif partner_id == "meredith":
					SaveState.set_flag("player_romanced_meredith", false)
			
			partner.relationship_kind = 0
			partner.relationship_level -=1
		
			GlobalMessageDialog.show_message("What has been done has been undone [pause]for everyone but you.")
		
		else:
			GlobalMessageDialog.show_message("Some marks refuse to leave. Some things refuse to change.\n[pause]Some part of you will always remain.")
			return false

	return true
