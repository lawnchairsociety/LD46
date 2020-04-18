extends Node2D

const PORTAL = preload("res://Scenes/PowerUpPortal.tscn")
const POWERUP = preload("res://Scenes/Antivirus.tscn")

onready var spawnPoints = $SpawnPoints

var spawn_position = Vector2.ZERO
var stats = PlayerStats

func _ready():
	EventBus.connect("powerup_portal_open_complete", self, "spawn_powerup")


func get_spawn_position():
	var points = spawnPoints.get_children()
	points.shuffle()
	return points[0].global_position


func spawn_portal():
	spawn_position = get_spawn_position()
	var portal = PORTAL.instance()
	var main = get_tree().current_scene
	main.add_child(portal)
	portal.global_position = spawn_position
	
		
func spawn_powerup():
	var powerup = POWERUP.instance()
	var main = get_tree().current_scene
	main.add_child(powerup)
	powerup.global_position = spawn_position


func _on_Timer_timeout():
	spawn_portal()
