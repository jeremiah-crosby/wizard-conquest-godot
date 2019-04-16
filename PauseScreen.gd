extends Control

signal unpause
signal quit

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().set_input_as_handled()
		emit_signal("unpause")
	else:
		pass


func _on_ContinueButton_pressed():
	emit_signal("unpause")


func _on_QuitButton_pressed():
	emit_signal("quit")
