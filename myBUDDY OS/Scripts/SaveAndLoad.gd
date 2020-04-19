extends Node


const SAVE_DATA_PATH = "user://save_data.json"
const OTHER_DATA_PATH = "res://save_data.json"

var default_save_data = {
	health = 100,
	max_health = 100,
	cpu_upgrade_multiplier = 1,
	ram_upgrade_multiplier = 1,
	antivirus_multiplier = 1,
	email_filter_multiplier = 1,
	ai_multiplier = 1,
	firewall_multiplier = 1,
	viruses_cleaned = 0,
	worms_cleaned = 0,
	spam_stopped = 0,
	malware_removed = 0,
	hackers_stopped = 0,
	crypto_miners_repurposed = 0,
	achievements = {
		health_over_9000 = 0,
		one_virus_cleaned = 0,
		one_worms_cleaned = 0,
		one_spam_stopped = 0,
		one_malware_removed = 0,
		one_hackers_stopped = 0,
		one_crypto_miners_repurposed = 0,
		onetwoeight_virus_cleaned = 0,
		onetwoeight_worms_cleaned = 0,
		onetwoeight_spam_stopped = 0,
		onetwoeight_malware_removed = 0,
		onetwoeight_hackers_stopped = 0,
		onetwoeight_crypto_miners_repurposed = 0,
		hacker = 0
	}
}


func save_data_to_file(save_data):
	var json_string = to_json(save_data)
	var save_file = File.new()
	save_file.open(SAVE_DATA_PATH, File.WRITE)
	save_file.store_line(json_string)
	save_file.close()
	
	var sanity_file = File.new()
	sanity_file.open(OTHER_DATA_PATH, File.WRITE)
	sanity_file.store_line(json_string)
	sanity_file.close()


func load_data_from_file():
	var save_file = File.new()
	var sanity_file = File.new()
	if not save_file.file_exists(SAVE_DATA_PATH):
		print("SAVE FILE NOT FOUND")
		save_file.close()
		return default_save_data
	
	elif not sanity_file.file_exists(OTHER_DATA_PATH):
		print("SANITY FILE NOT FOUND")
		sanity_file.close()
		return default_save_data
	else:
		save_file.open(SAVE_DATA_PATH, File.READ)
		var save_data = parse_json(save_file.get_as_text())
		save_file.close()
		
		sanity_file.open(OTHER_DATA_PATH, File.READ)
		var sanity_data = parse_json(sanity_file.get_as_text())
		sanity_file.close()
		
		print()
		
		if str(save_data) == str(sanity_data):
			return save_data
		else:
			print("HACKER!!!!")
			default_save_data.achievements.hacker = 1
			return default_save_data


func delete_save_files():
	var dir = Directory.new()
	dir.remove(SAVE_DATA_PATH)
	dir.remove(OTHER_DATA_PATH)
