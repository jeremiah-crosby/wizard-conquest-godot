tool
extends KinematicBody2D

export(Texture) var texture setget texture_set, texture_get;

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func texture_set(tex):
	$Sprite.texture = tex;
	
func texture_get():
	return $Sprite.texture;