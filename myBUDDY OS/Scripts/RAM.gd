extends RigidBody2D


var stats = PlayerStats
onready var soundPlayer = $PowerUpSoundPlayer

func _ready():
	set_process_input(true)


func _on_RAM_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed():
			stats.ram_upgrade_multiplier += 1
			soundPlayer.play()


func _on_Timer_timeout():
	queue_free()


func _on_PowerUpSoundPlayer_finished():
	queue_free()
