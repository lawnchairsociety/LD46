extends KinematicBody2D


#movement variables
export(int) var FRICTION = 200
export(int) var ACCELERATION = 50
export(int) var MAX_SPEED = 50
export(int) var health = 100

var velocity = Vector2.ZERO
var direction = Vector2.LEFT
var knockback_vector = Vector2.ZERO
var knockback = Vector2.ZERO
var collision
var stats = PlayerStats

enum enemyStates {
	IDLE,
	WANDER,
	CHASE
}
var state = enemyStates.IDLE
var stateTimer

onready var animationPlayer = $AnimationPlayer
onready var sprite = $Sprite
onready var buddyDetectionZone = $BuddyDetectionZone
onready var WINDOWSIZE = get_viewport_rect().size
onready var soundPlayer = $EnemyHitSoundPlayer

func _ready():
	randomize()
	set_process_input(true)
	stateTimer = get_tree().create_timer(5)


func _physics_process(delta):
	knockback = knockback.move_toward(Vector2.ZERO, FRICTION * delta)
	knockback = move_and_slide(knockback)
	
	match state:
		enemyStates.IDLE:
			animationPlayer.play("Idle")
			velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
			seek_buddy()
			
		enemyStates.WANDER:
			animationPlayer.play("Walk")
			walk_state(delta)
			seek_buddy()
			
		enemyStates.CHASE:
			animationPlayer.play("Walk")
			var buddy = buddyDetectionZone.buddy
			if buddy != null:
				var direction = (buddy.global_position - global_position).normalized()
				velocity = velocity.move_toward(direction * MAX_SPEED, ACCELERATION * delta)
				sprite.flip_h = velocity.x > 0
			else:
				pick_new_state()
			
	collision = move_and_collide(velocity * delta)
	

func seek_buddy():
	if buddyDetectionZone.can_see_buddy():
		state = enemyStates.CHASE
	else:
		pick_new_state()


func pick_new_state():
	if stateTimer.time_left <= 0:
		var time = rand_range(3, 5)
		stateTimer = get_tree().create_timer(time)
		yield(stateTimer, "timeout")
		var chooser = rand_range(0,1)
		if chooser > 0.5:
			state = enemyStates.WANDER
			direction = Vector2(rand_range(100, WINDOWSIZE.x-100), rand_range(100, WINDOWSIZE.y-100)).normalized()
		else:
			state = enemyStates.IDLE
		if check_out_of_bounds():
			state = enemyStates.WANDER


func walk_state(delta):
	if check_out_of_bounds():
		direction = (Vector2(WINDOWSIZE.x / 2, WINDOWSIZE.y / 2) - global_position).normalized()
	velocity = velocity.move_toward(direction * MAX_SPEED, ACCELERATION * delta)
	sprite.flip_h = velocity.x > 0


func check_out_of_bounds():
	if global_position.x <= 0 || global_position.x >= WINDOWSIZE.x || global_position.y <= 0 || global_position.y >= WINDOWSIZE.y:
		return true
	return false


func _on_Virus_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed():
			health -= stats.base_attack * stats.antivirus_multiplier
			soundPlayer.play()


func _on_Hitbox_area_entered(area):
	if collision:
		var motion = collision.remainder.bounce(collision.normal)
		velocity = velocity.bounce(collision.normal)
		direction = velocity.normalized()


func _on_Hitbox_body_entered(body):
	var main = get_tree().current_scene
	stats.health -= 1
	knockback = (Vector2(WINDOWSIZE.x / 2, WINDOWSIZE.y / 2) - global_position).normalized() * 125


func _on_EnemyHitSoundPlayer_finished():
	if health <= 0:
		stats.set_virus_cleaned(stats.viruses_cleaned + 1)
		stats.enemies_on_screen -= 1
		queue_free()
