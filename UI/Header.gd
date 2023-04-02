extends Label

var time_elapsed = 0
var duration = 2
var colors = [Color(1, 0, 0), Color(1, 1, 0), Color(0, 1, 0), Color(0, 1, 1), Color(0, 0, 1), Color(1, 0, 1)] # red, yellow, green, cyan, blue, magenta
var current_color_index = 0

func _process(delta):
	time_elapsed += delta
	if time_elapsed >= duration:
		time_elapsed = 0
		current_color_index = (current_color_index + 1) % colors.size()
		
	var t = time_elapsed / duration
	var start_color = colors[current_color_index]
	var next_color_index = (current_color_index + 1) % colors.size()
	var end_color = colors[next_color_index]
	var color = start_color.lerp(end_color, t)
	self.add_theme_color_override("font_color", color)
	


func _on_quit_mouse_entered():
	pass # Replace with function body.
