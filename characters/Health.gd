extends Node

class_name Health

signal died

export var max_amount = 100
export var current_amount = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func take_damage(damage_source):
	current_amount = current_amount - damage_source.damage
	if current_amount <= 0:
		emit_signal("died")