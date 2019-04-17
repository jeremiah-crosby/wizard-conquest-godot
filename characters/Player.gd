extends KinematicBody2D

const BASE_SPEED = 200
var velocity = Vector2()

func _physics_process(delta):
	if Input.is_action_pressed("play_move_left"):
		velocity.x = -1
	elif Input.is_action_pressed("play_move_right"):
		velocity.x = 1
	elif Input.is_action_pressed("play_move_down"):
		velocity.y = 1
	elif Input.is_action_pressed("play_move_up"):
		velocity.y = -1
	else:
		velocity.x = 0
		velocity.y = 0
		
	self.move_and_slide(velocity.normalized() * BASE_SPEED)