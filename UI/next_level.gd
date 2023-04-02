extends Control

@onready var click = $Next/Click
@onready var pressed = $Next/Pressed

	


func _on_quit_2_pressed():
	get_tree().quit()


func _on_next_mouse_entered():
	click.play()


func _on_quit_2_mouse_entered():
	click.play()


func _on_next_pressed():
	pressed.play()
	get_tree().change_scene_to_file("res://Levels/arena_3.tscn")
