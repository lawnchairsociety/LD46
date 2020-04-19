extends KinematicBody2D


#movement variables
export(int) var FRICTION = 200
export(int) var ACCELERATION = 50
export(int) var MAX_SPEED = 50

var velocity = Vector2.ZERO
var direction = Vector2.LEFT
var knockback_vector = Vector2.ZERO
var knockback = Vector2.ZERO
var collision
var stats = PlayerStats

enum buddyStates {
	IDLE,
	WANDER,
	THINK
}
var state = buddyStates.IDLE
var stateTimer

onready var animationPlayer = $AnimationPlayer
onready var sprite = $Sprite
onready var WINDOWSIZE = get_viewport_rect().size


func _ready():
	randomize()
	stats.connect("no_health", self, "queue_free")
	stateTimer = get_tree().create_timer(5)


func _physics_process(delta):
	knockback = knockback.move_toward(Vector2.ZERO, FRICTION * delta)
	knockback = move_and_slide(knockback)
	
	match state:
		buddyStates.IDLE:
			animationPlayer.play("Idle")
			velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
			pick_new_state()
			
		buddyStates.WANDER:
			animationPlayer.play("Walk")
			walk_state(delta)
			pick_new_state()
			
		buddyStates.THINK:
			animationPlayer.play("Think")
			velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
			pick_new_state()
			
	collision = move_and_collide(velocity * delta)
	
	

func pick_new_state():
	if stateTimer.time_left <= 0:
		var time = rand_range(3, 5)
		stateTimer = get_tree().create_timer(time)
		yield(stateTimer, "timeout")
		state = randi() % buddyStates.size()
		if state == buddyStates.WANDER:
			direction = Vector2(rand_range(-1, 1), rand_range(-1, 1)).normalized()
	if check_out_of_bounds():
			state = buddyStates.WANDER
			

func walk_state(delta):
	if check_out_of_bounds():
		direction = (Vector2(WINDOWSIZE.x / 2, WINDOWSIZE.y / 2) - global_position).normalized()
	velocity = velocity.move_toward(direction * MAX_SPEED, ACCELERATION * delta)
	sprite.flip_h = velocity.x > 0


func check_out_of_bounds():
	if global_position.x <= 0 || global_position.x >= WINDOWSIZE.x || global_position.y <= 0 || global_position.y >= WINDOWSIZE.y:
		return true
	return false

func _on_Hitbox_area_entered(area):
	if collision:
		var motion = collision.remainder.bounce(collision.normal)
		velocity = velocity.bounce(collision.normal)
		direction = velocity.normalized()


func _on_Hitbox_body_entered(body):
	var main = get_tree().current_scene
	stats.health -= 1
	knockback = (Vector2(WINDOWSIZE.x / 2, WINDOWSIZE.y / 2) - global_position).normalized() * 125
