extends Node

var player

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func initialize(player):
	self.player = player
	$ScreenShake.initialize(player)
