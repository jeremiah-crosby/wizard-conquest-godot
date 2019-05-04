extends "res://state_machine/state.gd"

var game_over_screen

func enter():
	game_over_screen = ResourceLoader.load("res://game_over/GameOver.tscn").instance()
	get_tree().get_root().call_deferred("add_child", game_over_screen)

func exit():
	game_over_screen.queue_free()
	
func handle_input(event):
	if event.is_action_pressed("ui_cancel") or event.is_action_pressed("ui_accept"):
		emit_signal("finished", "title")
		return
	.handle_input(event)
