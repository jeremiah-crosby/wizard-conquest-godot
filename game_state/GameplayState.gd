extends "res://state_machine/state.gd"

var initial_level_name = "res://levels/tomb/TombMap.tscn"

func enter():
	print("Entered GameplayState...")
	var next_scene = ResourceLoader.load(self.initial_level_name)
	var next_scene_instance = next_scene.instance()
	var root = get_tree().get_root()
	root.call_deferred("add_child", next_scene_instance)
