extends Control

@onready var click = $Back/Click
@onready var pressed = $Back/Pressed


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_back_pressed():
	pressed.play()
	get_tree().change_scene_to_file("res://UI/welcome_page.tscn")


func _on_back_mouse_entered():
	click.play()
