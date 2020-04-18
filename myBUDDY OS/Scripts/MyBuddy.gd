extends KinematicBody2D


#movement variables
export(int) var FRICTION = 200
export(int) var ACCELERATION = 300
export(int) var MAX_SPEED = 50

var velocity = Vector2.ZERO
var direction = Vector2.LEFT

enum buddyStates {
	IDLE,
	WALK,
	THINK
}
var state = buddyStates.IDLE
var stateTimer

onready var animationPlayer = $AnimationPlayer
onready var sprite = $Sprite


func _ready():
	randomize()
	stateTimer = get_tree().create_timer(5)


func _physics_process(delta):
	match state:
		buddyStates.IDLE:
			animationPlayer.play("Idle")
			velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
			pick_new_state()
			
		buddyStates.WALK:
			animationPlayer.play("Walk")
			walk_state(delta)
			pick_new_state()
			
		buddyStates.THINK:
			animationPlayer.play("Think")
			velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
			pick_new_state()
			
	velocity = move_and_slide(velocity)
	

func pick_new_state():
	if stateTimer.time_left <= 0:
		var time = rand_range(5, 10)
		stateTimer = get_tree().create_timer(time)
		yield(stateTimer, "timeout")
		state = randi() % buddyStates.size()


func walk_state(delta):
	velocity = velocity.move_toward(direction * MAX_SPEED, ACCELERATION * delta)
	sprite.flip_h = velocity.x > 0


func _on_Hitbox_area_entered(area):
	direction *= -1
