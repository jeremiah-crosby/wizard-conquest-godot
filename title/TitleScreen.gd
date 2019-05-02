extends Control

signal start_game

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("PanelContainer/MarginContainer/VBoxContainer2/VBoxContainer/StartButton").grab_focus()


func _on_StartButton_pressed():
	print("Start game pressed")
	emit_signal("start_game")


func _on_Button_pressed():
	get_tree().quit()
