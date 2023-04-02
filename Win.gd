extends Control

@onready var click = $Restart2/Click
@onready var pressed = $Restart2/Pressed

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_restart_2_pressed():
	pressed.play()
	get_tree().change_scene_to_file("res://Levels/welcome_screen.tscn")


func _on_restart_2_mouse_entered():
	click.play()
