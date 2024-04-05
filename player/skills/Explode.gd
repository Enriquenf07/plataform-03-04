extends State

func enter():
	super()
	var explosion = parent.explosionScene.instantiate()
	explosion.damage = 500
	explosion.position = parent.global_position
	parent.add_sibling(explosion)
	parent.queue_free()
	
