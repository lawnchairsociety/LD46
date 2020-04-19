extends Node2D

const PORTAL = preload("res://Scenes/PowerUpPortal.tscn")
const ANTIVIRUS = preload("res://Scenes/Antivirus.tscn")
const FIREWALL = preload("res://Scenes/Firewall.tscn")
const AI = preload("res://Scenes/AI.tscn")
const CPU = preload("res://Scenes/CPU.tscn")
const RAM = preload("res://Scenes/RAM.tscn")
const EMAIL_FILTER = preload("res://Scenes/EmailFilter.tscn")
const WARRANTY = preload("res://Scenes/Warranty.tscn")

var POWERUPS

onready var spawnPoints = $SpawnPoints

var spawn_position = Vector2.ZERO
var stats = PlayerStats

func _ready():
	POWERUPS = [ANTIVIRUS, FIREWALL, AI, CPU, RAM, WARRANTY, EMAIL_FILTER]
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
	POWERUPS.shuffle()
	var powerup = POWERUPS[0].instance()
	var main = get_tree().current_scene
	main.add_child(powerup)
	powerup.global_position = spawn_position


func _on_Timer_timeout():
	spawn_portal()
