extends Area2D

@export_enum("Cooldown", "HitOnce", "DisableHitBox") var HurtBoxType = 0

@onready var collision = $CollisionShape2D
@onready var disableTimer = $DisableTimer
var attacking_body = null
var willBeDestroyed = false
signal hurt(damage)

#when enters area gets hurt
func _on_area_entered(area):
	if area.is_in_group("attack"):
		if not area.get("damage") == null:
			attacking_body = area.get_parent().name
			if attacking_body == "CharacterBody2D":
				get_tree().call_group("enemy", "attack")
			match HurtBoxType:
				0: #cooldown
					collision.call_deferred('set', 'disabled', true)
					disableTimer.start()
				1: #HitOnce
					pass
				2: #DisableHitBox
					if area.has_method("tempdisable"):
						area.tempdisable()
			var damage = area.damage
			emit_signal('hurt', damage)

func _on_disable_timer_timeout():
	collision.call_deferred('set', 'disabled', false)
	if attacking_body == "PlayerSlave":
		get_tree().call_group("player", "endAttack")
	get_tree().call_group("enemy", "idle")
	if (willBeDestroyed):
		get_parent().queue_free()


func _on_character_body_2d_free_mem():
	willBeDestroyed = true # Replace with function body.
