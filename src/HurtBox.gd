extends Area2D

class_name MyHurtBox
@export var damage_amount = 1

signal hit(damage_amount)

func _ready():
	collision_layer =  2
	collision_mask = 0

func _on_Hurtbox_area_entered(area):
	if area.is_in_group("Hitbox"):
		area.emit_signal("hit", damage_amount)
