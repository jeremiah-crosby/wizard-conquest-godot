extends KinematicBody2D

const BASE_SPEED = 300

func _physics_process(delta):
	var velocity = Vector2()
	if Input.is_action_pressed("play_move_left"):
		velocity.x = -1
	
	if Input.is_action_pressed("play_move_right"):
		velocity.x = 1
		
	if Input.is_action_pressed("play_move_down"):
		velocity.y = 1
	
	if Input.is_action_pressed("play_move_up"):
		velocity.y = -1
	
		
	self.move_and_slide(velocity.normalized() * BASE_SPEED)