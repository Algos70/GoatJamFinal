extends Node2D


#portal mechanic
func _on_area_2d_body_entered(body):
	if body.name == 'PlayerSlave':
		get_tree().change_scene_to_file("res://UI/next_level_page.tscn")
