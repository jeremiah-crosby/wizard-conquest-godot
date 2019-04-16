extends "res://state_machine/state.gd"

var title_scene

func enter():
	print("Entered TitleState...")
	title_scene = ResourceLoader.load("res://title/TitleScreen.tscn").instance()
	var root = get_tree().get_root()
	title_scene.connect("start_game", self, "start_game")
	root.call_deferred("add_child", title_scene)
	
func exit():
	title_scene.queue_free()
	
func start_game():
	print("Starting game")
	emit_signal("finished", "gameplay")