tool
extends KinematicBody2D

export(Texture) var texture setget texture_set, texture_get;
export(Shape2D) var collision_shape setget collision_shape_set, collision_shape_get

# Called when the node enters the scene tree for the first time.
func _ready():
	$Health.connect("died", self, "on_died")
	$Health.connect("health_changed", get_node("RemoteTransform2D/HealthBar"), "on_health_changed")
	
	set_health_bar_position()
	
func set_health_bar_position():
	var height = -($Sprite.get_rect().size.y/2)
	$RemoteTransform2D.translate(Vector2(0, height - 20))
	get_node("RemoteTransform2D/HealthBar").set_anchors_preset(Control.PRESET_CENTER_TOP)
	
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
	get_node("DamageSource/CollisionShape2D").shape = shape
	get_node("HitBox/CollisionShape2D").shape = shape
	
func collision_shape_get():
	return get_node("DamageSource/CollisionShape2D").shape
