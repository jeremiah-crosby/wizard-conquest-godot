extends "res://state_machine/state.gd"

func enter():
	print("Entered TitleState...")
	var title_scene = ResourceLoader.load("res://title/TitleScreen.tscn")
	var title_scene_instance = title_scene.instance()
	var root = get_tree().get_root()
	print("Root name = " + root.name)
	title_scene_instance.connect("start_game", self, "start_game")
	root.call_deferred("add_child", title_scene_instance)
	
func start_game():
	emit_signal("finished", "gameplay")