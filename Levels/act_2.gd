extends Control

@onready var click = $Next2/AudioStreamPlayer
@onready var pressed = $Next2/AudioStreamPlayer2


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_next_2_mouse_entered():
	click.play()


func _on_next_2_pressed():
	pressed.play()
	get_tree().change_scene_to_file("res://Levels/arena_3.tscn")
