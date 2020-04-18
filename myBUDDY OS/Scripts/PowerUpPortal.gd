extends Node2D


onready var animationPlayer = $AnimationPlayer


func _ready():
	
	animationPlayer.play("Open")


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Close":
		queue_free()
	if anim_name == "Idle":
		animationPlayer.play("Close")
	if anim_name == "Open":
		EventBus.emit_signal("powerup_portal_open_complete")
		animationPlayer.play("Idle")
	
