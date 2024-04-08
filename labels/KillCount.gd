extends Label


func _process(delta):
	text = 'Skeletons killed: {kills}'.format({'kills': GameState.kill_count})
