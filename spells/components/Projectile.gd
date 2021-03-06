tool
extends KinematicBody2D

export(Shape2D) var collision_shape setget collision_shape_set, collision_shape_get

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

func _on_DamageSource_area_entered(area):
	get_parent().queue_free()
	
func collision_shape_set(shape):
	get_node("DamageSource/CollisionShape2D").shape = shape

func collision_shape_get():
	return get_node("DamageSource/CollisionShape2D").shape