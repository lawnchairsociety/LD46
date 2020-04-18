extends RigidBody2D


var stats = PlayerStats

func _ready():
	set_process_input(true)
	

func _on_Antivirus_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed():
			stats.antivirus_multiplier += 1
			queue_free()




func _on_Timer_timeout():
	queue_free()
