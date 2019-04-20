extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var velocity = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _draw():
	draw_circle(Vector2(), 10, Color.red)

func _physics_process(delta):
	move_and_collide(velocity)

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
