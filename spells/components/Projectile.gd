tool
extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var velocity = Vector2()
export(Shape2D) var collision_shape setget collision_shape_set, collision_shape_get

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _draw():
	draw_circle(Vector2(), 10, Color.red)

func _physics_process(delta):
	move_and_collide(velocity)

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func collision_shape_set(shape):
	get_node("Area2D/CollisionShape2D").shape = shape
	
func collision_shape_get():
	return get_node("Area2D/CollisionShape2D").shape

func _on_Area2D_area_entered(area):
	get_parent().queue_free()
