extends Node

export(int) var shake_magnitude = 0
export(float) var shake_duration = 0.0

var elapsed = 0
var player

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)

func initialize(player):
	self.player = player
	
func _physics_process(delta):
	if elapsed >= shake_duration:
		set_process(false)
		return
		
	elapsed += delta
	player.get_node("Camera2D").offset = Vector2(rand_range(-shake_magnitude, shake_magnitude), rand_range(-shake_magnitude, shake_magnitude));
