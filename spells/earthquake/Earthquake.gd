extends Node2D

var player

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func initialize(player):
	self.player = player
	$ScreenShake.initialize(player)
	$AnimatedSprite.play()
	$AnimatedSprite.visible = true


func _on_AnimatedSprite_animation_finished():
	$AnimatedSprite.stop()
	$AnimatedSprite.visible = false
	queue_free()
