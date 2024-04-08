extends Button

func _on_pressed():
	GameState.reset()
	get_tree().change_scene_to_file("res://general/main.tscn")
