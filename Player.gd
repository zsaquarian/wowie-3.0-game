extends KinematicBody2D

var velocity = Vector2(0, 0)
const SPEED = 100
const JUMP_FORCE = -600

func _physics_process(_delta):
	if Input.is_action_pressed("right"):
		velocity.x += SPEED
	if Input.is_action_pressed("left"):
		velocity.x -= SPEED

	velocity.y += 30

	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y = JUMP_FORCE

	velocity = move_and_slide(velocity, Vector2.UP)

	velocity.x = lerp(velocity.x, 0, 0.1)
