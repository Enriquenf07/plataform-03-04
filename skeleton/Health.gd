extends IHealth

func die():
	parent.queue_free()
