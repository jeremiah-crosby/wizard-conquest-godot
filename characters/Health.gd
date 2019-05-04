extends Node

class_name Health

signal health_changed(current_amount, max_amount)
signal died

export var max_amount = 100
export var current_amount = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	emit_signal("health_changed", current_amount, max_amount)

func take_damage(damage_source):
	current_amount = current_amount - damage_source.damage
	emit_signal("health_changed", current_amount, max_amount)
	if current_amount <= 0:
		emit_signal("died")