extends Control

@onready var click_sound = $Quit2/Click
@onready var pressed_sound = $Quit2/Pressed


func _ready():
	pass



func _on_restart_pressed():
	pressed_sound.play()
	get_tree().change_scene_to_file("res://Levels/game_level.tscn")


func _on_quit_2_pressed():
	get_tree().quit()




func _on_restart_mouse_entered():
	click_sound.play()


func _on_quit_2_mouse_entered():
	click_sound.play()
