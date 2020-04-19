extends Node



export(int) var base_attack = 10
export(int) var cpu_upgrade_multiplier = 1
export(int) var ram_upgrade_multiplier = 1
export(int) var antivirus_multiplier = 1
export(int) var email_filter_multiplier = 1
export(int) var ai_multiplier = 1
export(int) var firewall_multiplier = 1
export(int) var max_enemies_on_screen = 5

onready var max_health = 100
onready var health = max_health setget set_health
onready var viruses_cleaned = 0 setget set_virus_cleaned
onready var worms_cleaned = 0 setget set_worms_cleaned
onready var spam_stopped = 0 setget set_spam_stopped
onready var malware_removed = 0 setget set_malware_removed
onready var hackers_stopped = 0 setget set_hackers_stopped
onready var crypto_miners_repurposed = 0 setget set_crypto_miners_repurposed

var enemies_on_screen = 0

onready var save_data = {
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
} setget set_save_data

signal no_health


func set_save_data(value):
	save_data = value
	set_health(save_data.health)
	set_virus_cleaned(save_data.viruses_cleaned)
	set_worms_cleaned(save_data.worms_cleaned)
	set_spam_stopped(save_data.spam_stopped)
	set_malware_removed(save_data.malware_removed)
	set_hackers_stopped(save_data.hackers_stopped)
	set_crypto_miners_repurposed(save_data.crypto_miners_repurposed)
	max_health = save_data.max_health
	cpu_upgrade_multiplier = save_data.cpu_upgrade_multiplier
	ram_upgrade_multiplier = save_data.ram_upgrade_multiplier
	antivirus_multiplier = save_data.antivirus_multiplier
	email_filter_multiplier = save_data.email_filter_multiplier
	ai_multiplier = save_data.ai_multiplier
	firewall_multiplier = save_data.firewall_multiplier
	

func set_health(value):
	health = value
	if health <= 0:
		SaveAndLoad.delete_save_files()
		emit_signal("no_health")
		
		
func set_virus_cleaned(value):
	viruses_cleaned = value
	save_data.health = health


func set_worms_cleaned(value):
	worms_cleaned = value


func set_spam_stopped(value):
	spam_stopped = value


func set_malware_removed(value):
	malware_removed = value


func set_hackers_stopped(value):
	hackers_stopped = value


func set_crypto_miners_repurposed(value):
	crypto_miners_repurposed = value


func save_all_data():
	save_data.health = health
	save_data.max_health = max_health
	save_data.cpu_upgrade_multiplier = cpu_upgrade_multiplier
	save_data.ram_upgrade_multiplier = ram_upgrade_multiplier
	save_data.antivirus_multiplier = antivirus_multiplier
	save_data.email_filter_multiplier = email_filter_multiplier
	save_data.ai_multiplier = ai_multiplier
	save_data.firewall_multiplier = firewall_multiplier
	save_data.viruses_cleaned = viruses_cleaned
	save_data.worms_cleaned = worms_cleaned
	save_data.spam_stopped = spam_stopped
	save_data.malware_removed = malware_removed
	save_data.hackers_stopped = hackers_stopped
	save_data.crypto_miners_repurposed = crypto_miners_repurposed
	if max_health > 9000:
		save_data.achievements.health_over_9000 = 1
	if viruses_cleaned > 0:
		save_data.achievements.one_virus_cleaned = 1
	if worms_cleaned > 0:
		save_data.achievements.one_worms_cleaned = 1
	if spam_stopped > 0:
		save_data.achievements.one_spam_stopped = 1
	if malware_removed > 0:
		save_data.achievements.one_malware_removed = 1
	if hackers_stopped > 0:
		save_data.achievements.one_hackers_stopped = 1
	if crypto_miners_repurposed > 0:
		save_data.achievements.one_crypto_miners_repurposed = 1
	if viruses_cleaned > 127:
		save_data.achievements.onetwoeight_virus_cleaned = 1
	if worms_cleaned > 127:
		save_data.achievements.onetwoeight_worms_cleaned = 1
	if spam_stopped > 127:
		save_data.achievements.onetwoeight_spam_stopped = 1
	if malware_removed > 127:
		save_data.achievements.onetwoeight_malware_removed = 1
	if hackers_stopped > 127:
		save_data.achievements.onetwoeight_hackers_stopped = 1
	if crypto_miners_repurposed > 127:
		save_data.achievements.onetwoeight_crypto_miners_repurposed = 1
	if save_data.achievements.hacker == 1:
		save_data.achievements.hacker = 1
	SaveAndLoad.save_data_to_file(save_data)
