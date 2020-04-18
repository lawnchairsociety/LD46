extends Area2D


var buddy = null


func can_see_buddy():
	return buddy != null


func _on_BuddyDetectionZone_body_entered(body):
	buddy = body


func _on_BuddyDetectionZone_body_exited(body):
	buddy = null
