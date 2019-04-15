extends "res://state_machine/state.gd"

var initial_level_name = "res://levels/tomb/TombMap.tscn"
var pause_screen

func enter():
	print("Entered GameplayState...")
	pause_screen = ResourceLoader.load("res://PauseScreen.tscn").instance();
	pause_screen.connect("unpause", self, "hide_pause")
	var next_scene = ResourceLoader.load(self.initial_level_name)
	var next_scene_instance = next_scene.instance()
	var root = get_tree().get_root()
	root.call_deferred("add_child", next_scene_instance)
	
func exit():
	pause_screen.queue_free()
	
func handle_input(event):
	if event.is_action_pressed("ui_cancel"):
		show_pause()
		return
	.handle_input(event)
		
func show_pause():
	get_tree().set_pause(true)
	get_tree().get_root().call_deferred("add_child", pause_screen)
	
func hide_pause():
	print("Unpause")
	get_tree().set_pause(false)
	pause_screen.get_parent().remove_child(pause_screen)
