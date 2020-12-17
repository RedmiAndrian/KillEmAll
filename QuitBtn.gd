extends Button



func _on_QuitBtn_button_up():
	get_tree().quit()
	print("pressed")


func _on_QuitBtn_button_down():
	get_tree().quit()
