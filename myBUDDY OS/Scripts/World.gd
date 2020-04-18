extends Node


var stats = PlayerStats

onready var healthLabel = $StatsContainer/VBoxContainer/HealthLabel
onready var avMultiplierLabel = $StatsContainer/VBoxContainer/AVMultiplierLabel

func _ready():
	get_tree().get_root().set_transparent_background(true)


func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()
	update_health_label()
	update_av_multiplier_label()


func update_save_data():
	var save_data = SaveAndLoad.load_data_from_file()
	

func update_health_label():
	healthLabel.text = "Health: " + str(stats.health)


func update_av_multiplier_label():
	avMultiplierLabel.text = "AV Multi: " + str(stats.antivirus_multiplier)
