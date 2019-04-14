extends Sprite

func _input(event):
	if (event.is_action("play_move_left")):
		self.position.x -= 1
