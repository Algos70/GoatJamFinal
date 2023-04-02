extends Control

@onready var Click = $Play/Click
@onready var pressed = $Play/Pressed

func _ready():
	pass

func _on_play_pressed():
	pressed.play()
	get_tree().change_scene_to_file("res://Levels/game_level.tscn")


func _on_quit_pressed():
	get_tree().quit()


func _on_play_mouse_entered():
	Click.play()


func _on_controls_pressed():
	pressed.play()
	get_tree().change_scene_to_file("res://UI/control_page.tscn")
