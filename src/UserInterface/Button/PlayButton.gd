extends Button

export(String, FILE) var next_scene: = ""

func _get_configuration_warning() -> String:
	return "next_scene path must be set for the button to work." if next_scene == "" else ""


func _on_PlayButton_button_up():
	get_tree().change_scene(next_scene)
