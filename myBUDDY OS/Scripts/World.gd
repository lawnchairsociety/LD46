extends Node


const MENU = preload("res://Scenes/Menu.tscn")

onready var stats = PlayerStats
onready var healthValueLabel = $StatsBackground/StatsContainer/VBoxContainer/StatsVBoxContainer/StatsHBoxContainer/ValueContainer/HealthValueLabel
onready var cpuValueLabel = $StatsBackground/StatsContainer/VBoxContainer/StatsVBoxContainer/StatsHBoxContainer/ValueContainer/CPUValueLabel
onready var ramValueLabel = $StatsBackground/StatsContainer/VBoxContainer/StatsVBoxContainer/StatsHBoxContainer/ValueContainer/RAMValueLabel
onready var avValueLabel = $StatsBackground/StatsContainer/VBoxContainer/StatsVBoxContainer/StatsHBoxContainer/ValueContainer/AVValueLabel
onready var emailFilterValueLabel = $StatsBackground/StatsContainer/VBoxContainer/StatsVBoxContainer/StatsHBoxContainer/ValueContainer/EmailFilterValueLabel
onready var aiValueLabel = $StatsBackground/StatsContainer/VBoxContainer/StatsVBoxContainer/StatsHBoxContainer/ValueContainer/AIValueLabel
onready var firewallValueLabel = $StatsBackground/StatsContainer/VBoxContainer/StatsVBoxContainer/StatsHBoxContainer/ValueContainer/FirewallValueLabel

onready var virusValueLabel = $StatsBackground/StatsContainer/VBoxContainer/EnemyVBoxContainer/EnemyHBoxContainer/ValueContainer/VirusValueLabel
onready var wormValueLabel = $StatsBackground/StatsContainer/VBoxContainer/EnemyVBoxContainer/EnemyHBoxContainer/ValueContainer/WormValueLabel
onready var spamValueLabel = $StatsBackground/StatsContainer/VBoxContainer/EnemyVBoxContainer/EnemyHBoxContainer/ValueContainer/SpamValueLabel
onready var malwareValueLabel = $StatsBackground/StatsContainer/VBoxContainer/EnemyVBoxContainer/EnemyHBoxContainer/ValueContainer/MalwareValueLabel
onready var hackerValueLabel = $StatsBackground/StatsContainer/VBoxContainer/EnemyVBoxContainer/EnemyHBoxContainer/ValueContainer/HackerValueLabel
onready var cryptoMinerValueLabel = $StatsBackground/StatsContainer/VBoxContainer/EnemyVBoxContainer/EnemyHBoxContainer/ValueContainer/CryptoMinerValueLabel

func _ready():
	get_tree().get_root().set_transparent_background(true)
	update_save_data()
	SaveAndLoad.save_data_to_file(stats.save_data)

func _process(delta):
	update_all_labels()


func update_save_data():
	stats.save_data = SaveAndLoad.load_data_from_file()
	

func update_all_labels():
	update_health_label()
	update_cpu_label()
	update_ram_label()
	update_av_label()
	update_email_filter_label()
	update_ai_label()
	update_firewall_label()
	update_virus_label()
	update_worm_label()
	update_spam_label()
	update_malware_label()
	update_hacker_label()
	update_crypto_miner_label()


func update_health_label():
	healthValueLabel.text = str(stats.health)


func update_cpu_label():
	cpuValueLabel.text = str(stats.cpu_upgrade_multiplier)


func update_ram_label():
	ramValueLabel.text = str(stats.ram_upgrade_multiplier)


func update_av_label():
	avValueLabel.text = str(stats.antivirus_multiplier)


func update_email_filter_label():
	emailFilterValueLabel.text = str(stats.email_filter_multiplier)


func update_ai_label():
	aiValueLabel.text = str(stats.ai_multiplier)


func update_firewall_label():
	firewallValueLabel.text = str(stats.firewall_multiplier)


func update_virus_label():
	virusValueLabel.text = str(stats.viruses_cleaned)


func update_worm_label():
	wormValueLabel.text = str(stats.worms_cleaned)


func update_spam_label():
	spamValueLabel.text = str(stats.spam_stopped)


func update_malware_label():
	malwareValueLabel.text = str(stats.malware_removed)


func update_hacker_label():
	hackerValueLabel.text = str(stats.hackers_stopped)


func update_crypto_miner_label():
	cryptoMinerValueLabel.text = str(stats.crypto_miners_repurposed)


func _on_MenuButton_pressed():
	var menu = MENU.instance()
	var main = get_tree().current_scene
	main.add_child(menu)
