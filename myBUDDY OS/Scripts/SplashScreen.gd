extends Sprite


func _ready():
	get_tree().get_root().set_transparent_background(true)


func _on_Timer_timeout():
	get_tree().change_scene("res://Scenes/World.tscn")
