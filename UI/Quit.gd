extends Button

@onready var click_sound = $Click

func _ready():
	click_sound = $Click


func _on_pressed():
	click_sound.play()


func _on_mouse_entered():
	click_sound.play()
