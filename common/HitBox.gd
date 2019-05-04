extends Area2D

const DamageSource = preload("res://common/DamageSource.gd")


func _on_area_entered(area):
	if area is DamageSource:
		if not owner.has_node("Health"):
			return
		owner.get_node("Health").take_damage(area)
