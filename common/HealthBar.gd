extends VBoxContainer

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func on_health_changed(current_amount, max_amount):
	$HealthGauge.max_value = max_amount
	$HealthGauge.value = current_amount
	self.visible = true
	$Timer.start()


func _on_Timer_timeout():
	self.visible = false
