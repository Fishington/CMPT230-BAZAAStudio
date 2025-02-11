extends KinematicBody2D

const SPEED = 200
const JUMP_FORCE = -400
const GRAVITY = 800

var velocity = Vector2()

func _physics_process(delta):
	velocity.y += GRAVITY * delta  # Apply gravity

	if Input.is_action_pressed("ui_right"):
		velocity.x = SPEED
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -SPEED
	else:
		velocity.x = 0

	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = JUMP_FORCE

	velocity = move_and_slide(velocity, Vector2.UP)
