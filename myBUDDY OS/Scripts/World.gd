extends Node


func _ready():
	get_tree().get_root().set_transparent_background(true)


func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()
