extends Control

@onready var click = $Next/Click

	


func _on_quit_2_pressed():
	get_tree().quit()


func _on_next_mouse_entered():
	click.play()


func _on_quit_2_mouse_entered():
	click.play()
