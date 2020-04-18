extends Node


export(int) var max_health = 100
export(int) var base_attack = 1
export(int) var cpu_upgrade_multiplier = 1
export(int) var cloud_server_multiplier = 1
export(int) var ram_upgrade_multiplier = 1
export(int) var antivirus_multiplier = 1
export(int) var email_filter_multiplier = 1
export(int) var ai_multiplier = 1
export(int) var tensor_core_multiplier = 1
export(int) var max_enemies_on_screen = 5

onready var health = max_health setget set_health
onready var virus_cleaned = 0 setget set_virus_cleaned
onready var worms_cleaned = 0 setget set_worms_cleaned
onready var spam_stopped = 0 setget set_spam_stopped
onready var malware_removed = 0 setget set_malware_removed
onready var hackers_stopped = 0 setget set_hackers_stopped
onready var tracking_cookies_removed = 0 setget set_tracking_cookies_removed
onready var crypto_miners_repurposed = 0 setget set_crypto_miners_repurposed
onready var auditors_appeased = 0 setget set_auditors_appeased
onready var compliance_checks_passed = 0 setget set_compliance_checks_passed

var enemies_on_screen = 0

signal no_health


func set_health(value):
	health = value
	if health <= 0:
		emit_signal("no_health")
		
		
func set_virus_cleaned(value):
	virus_cleaned = value


func set_worms_cleaned(value):
	worms_cleaned = value


func set_spam_stopped(value):
	spam_stopped = value


func set_malware_removed(value):
	malware_removed = value


func set_hackers_stopped(value):
	hackers_stopped = value


func set_tracking_cookies_removed(value):
	tracking_cookies_removed = value


func set_crypto_miners_repurposed(value):
	crypto_miners_repurposed = value


func set_auditors_appeased(value):
	auditors_appeased = value
	
	
func set_compliance_checks_passed(value):
	compliance_checks_passed = value
