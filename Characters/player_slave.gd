extends CharacterBody2D

@export var SPEED = 600.0
const JUMP_VELOCITY = -600.0
var hp = 5
var leftPressed = false
var rightPressed = true
var is_attacking = false
var attack_animation_cooldown = 1

@onready var sprite = $AnimatedSprite2D
@onready var hitBox = $HitBox/CollisionShape2D
@onready var hpBar = $HealthBar/ProgressBar


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	hpBar.max_value = hp
	hpBar.value = hp

func _physics_process(delta):
	if attack_animation_cooldown > 0:
		attack_animation_cooldown -= delta
	else:
		is_attacking = false
	if (velocity.x == 0 and velocity.y == 0 and (not is_attacking)):
		sprite.play("idle")
	elif (not is_attacking):
		sprite.play("run")
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		
	# Handle Jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
	#flipping collisionshapes and sprite mumbo jumbo
	if Input.is_action_just_pressed("left"):
		sprite.flip_h = true
		if not leftPressed:
			hitBox.position.x *= -1
			rightPressed = false
			leftPressed = true
	if Input.is_action_just_pressed("right"):
		sprite.flip_h = false
		if not rightPressed:
			hitBox.position.x *= -1
			leftPressed = false
			rightPressed = true


func _on_hurt_box_hurt(damage):
	hp -= damage
	hpBar.value -= damage
	if hp <= 0:
		get_tree().change_scene_to_file("res://UI/game_over_page.tscn")
	print(hp)

func startAttack():
	attack_animation_cooldown = 1
	is_attacking = true
	sprite.play("attack")
func endAttack():
	sprite.play("run")
