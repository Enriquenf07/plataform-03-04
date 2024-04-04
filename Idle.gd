extends State

func process_physics(delta):
	print(parent.velocity.y)
	parent.velocity.y += gravity * delta
	for i in parent.get_slide_collision_count():
		var collision = parent.get_slide_collision(i)
		print("Collided with: ", collision.get_collider().name)
	parent.move_and_slide()
	return null
