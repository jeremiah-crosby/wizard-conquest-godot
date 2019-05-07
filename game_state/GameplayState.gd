extends "res://state_machine/state.gd"

var initial_level_name = "res://levels/tomb/TombMap.tscn"
var pause_screen
var level_scene
var hud

func enter():
	print("Entered GameplayState...")
	pause_screen = ResourceLoader.load("res://PauseScreen.tscn").instance();
	pause_screen.connect("unpause", self, "hide_pause")
	pause_screen.connect("quit", self, "quit_game")
	level_scene = ResourceLoader.load(self.initial_level_name).instance()
	var root = get_tree().get_root()
	root.call_deferred("add_child", level_scene)
	
	hud = ResourceLoader.load("res://hud/HUD.tscn").instance()
	root.call_deferred("add_child", hud)
	
	var player = level_scene.get_node("Player")
	var health_node = player.get_node("Health")
	health_node.connect("health_changed", hud, "_on_player_health_changed")
	health_node.connect("died", self, "_on_player_died")
	
func _on_player_died():
	emit_signal("finished", "game_over")
	
func exit():
	pause_screen.queue_free()
	level_scene.queue_free()
	hud.queue_free()
	
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
	
func quit_game():
	get_tree().set_pause(false)
	emit_signal("finished", "title")
