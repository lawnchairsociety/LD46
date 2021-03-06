extends Node2D

const PORTAL = preload("res://Scenes/EnemyPortal.tscn")
const VIRUS = preload("res://Scenes/Virus.tscn")
const CRYPTO_MINER = preload("res://Scenes/CryptoMiner.tscn")
const MALWARE = preload("res://Scenes/Malware.tscn")
const SPAM = preload("res://Scenes/Spam.tscn")
const WORM = preload("res://Scenes/Worm.tscn")
const HACKER = preload("res://Scenes/Hacker.tscn")

var ENEMIES

onready var spawnPoints = $SpawnPoints

var spawn_position = Vector2.ZERO
var stats = PlayerStats

func _ready():
	ENEMIES = [VIRUS, CRYPTO_MINER, MALWARE, SPAM, WORM, HACKER]
	EventBus.connect("enemy_portal_open_complete", self, "spawn_enemy")


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
	
		
func spawn_enemy():
	ENEMIES.shuffle()
	var enemy = ENEMIES[0].instance()
	var main = get_tree().current_scene
	main.add_child(enemy)
	enemy.global_position = spawn_position
	enemy.global_position.y += 24


func _on_Timer_timeout():
	if stats.enemies_on_screen < stats.max_enemies_on_screen:
		stats.enemies_on_screen += 1
		spawn_portal()
