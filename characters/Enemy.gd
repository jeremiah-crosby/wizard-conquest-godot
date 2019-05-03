tool
extends KinematicBody2D

export(Texture) var texture setget texture_set, texture_get;
export(Shape2D) var collision_shape setget collision_shape_set, collision_shape_get

const DamageSource = preload("res://common/DamageSource.gd")

# Called when the node enters the scene tree for the first time.
func _ready():
	$Health.connect("died", self, "on_died")
	
func on_died():
	get_parent().queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func texture_set(tex):
	$Sprite.texture = tex;
	
func texture_get():
	return $Sprite.texture;
	
func collision_shape_set(shape):
	get_node("Area2D/CollisionShape2D").shape = shape
	
func collision_shape_get():
	return get_node("Area2D/CollisionShape2D").shape

func _on_Area2D_area_entered(area):
	if area is DamageSource:
		$Health.take_damage(area)
