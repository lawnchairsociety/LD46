extends Node


const SAVE_DATA_PATH = "save_data.json"
const OTHER_DATA_PATH = "res://save_data.json"

var default_save_data = {
	health = 100,
	cpu_upgrade_multiplier = 1,
	cloud_server_multiplier = 1,
	ram_upgrade_multiplier = 1,
	antivirus_multiplier = 1,
	email_filter_multiplier = 1,
	ai_multiplier = 1,
	tensor_core_multiplier = 1,
	virus_cleaned = 0,
	worms_cleaned = 0,
	spam_stopped = 0,
	malware_removed = 0,
	hackers_stopped = 0,
	tracking_cookies_removed = 0,
	crypto_miners_repurposed = 0,
	auditors_appeased = 0,
	compliance_checks_passed = 0,
	achievements = {
		health_over_9000 = 0,
		one_virus_cleaned = 0,
		one_worms_cleaned = 0,
		one_spam_stopped = 0,
		one_malware_removed = 0,
		one_hackers_stopped = 0,
		one_tracking_cookies_removed = 0,
		one_crypto_miners_repurposed = 0,
		one_auditors_appeased = 0,
		one_compliance_checks_passed = 0,
		onetwoeight_virus_cleaned = 0,
		onetwoeight_worms_cleaned = 0,
		onetwoeight_spam_stopped = 0,
		onetwoeight_malware_removed = 0,
		onetwoeight_hackers_stopped = 0,
		onetwoeight_tracking_cookies_removed = 0,
		onetwoeight_crypto_miners_repurposed = 0,
		onetwoeight_auditors_appeased = 0,
		onetwoeight_compliance_checks_passed = 0,
		hacker = 0
	}
}


func save_data_to_file(save_data):
	var json_string = to_json(save_data)
	var save_file = File.new()
	save_file.open(SAVE_DATA_PATH, File.WRITE)
	save_file.store_line(json_string)
	save_file.close()
	save_file = File.new()
	save_file.open(OTHER_DATA_PATH, File.WRITE)
	save_file.store_line(json_string)
	save_file.close()


func load_data_from_file():
	var save_file = File.new()
	if not save_file.file_exists(SAVE_DATA_PATH):
		return default_save_data
	var sanity_file = File.new()
	if not sanity_file.file_exists(OTHER_DATA_PATH):
		return default_save_data

	save_file.open(SAVE_DATA_PATH, File.READ)
	var save_data = parse_json(save_file.get_as_text())
	save_file.close()
	
	
	sanity_file.open(SAVE_DATA_PATH, File.READ)
	var sanity_data = parse_json(sanity_file.get_as_text())
	sanity_file.close()
	if save_data == sanity_data:
		return save_data
	else:
		
		return default_save_data
