extends Area2D
class_name my_hitBox 


@export var damage_amount = 1

signal hit(damage_amount)

func _ready():
	collision_layer = 0
	collision_mask = 2

func _on_Hitbox_area_entered(area):
	if area.is_in_group("Hurtbox"):
		area.emit_signal("hit", damage_amount)

