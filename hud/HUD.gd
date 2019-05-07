extends Control

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_player_health_changed(current_amount, max_amount):
	get_node("CanvasLayer/MarginContainer/HBoxContainer/HealthAmountLabel").text = str(current_amount) + " / " + str(max_amount)
