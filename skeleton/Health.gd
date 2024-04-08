extends IHealth

func die():
	parent.free()
	GameState.add_kill()
