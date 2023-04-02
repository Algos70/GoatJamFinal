extends Node2D





func _on_area_2d_body_entered(_body):
	get_tree().change_scene_to_file("res://UI/game_over_page.tscn")
