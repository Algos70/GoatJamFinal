extends Area2D

@export var damage = 1

@onready var collision = $CollisionShape2D
@onready var disableTimer = $DisableHitBoxTimer
var target_position = null
var speed = 100 # replace with the speed at which the item should move

func tempdisable():
	collision.call_deferred('set', 'disabled', true)
	disableTimer.start()
	


func _on_disable_hit_box_timer_timeout():
	collision.call_deferred('set', 'disabled', false)
	

func start_move(position):
	target_position = position



func _process(delta):
	if (target_position != null):
		var current_position = self.position # get the current position of the item
		var direction = (target_position - current_position).normalized() # calculate the direction towards the target position
		var distance = current_position.distance_to(target_position) # calculate the distance to the target position
		if distance > 0: # if the item hasn't reached the target position yet
			var move_amount = min(distance, speed * delta) # calculate the amount to move in this iteration
			position += direction * move_amount # update the position of the item
		else:
			free()
	
