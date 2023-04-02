extends Control

@onready var click = $Fight/AudioStreamPlayer
@onready var pressed = $Fight/AudioStreamPlayer2

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_fight_pressed():
	pressed.play()
	get_tree().change_scene_to_file("res://Levels/arena_4.tscn")
	


func _on_fight_mouse_entered():
	click.play()
