extends State

@export
var explode_state: State

func process_physics(delta):
	for index in range(parent.get_slide_collision_count()):
		print(index) if index != 0 else null
		var collision = parent.get_slide_collision(index)
		var body = collision.get_collider()
		if body is CharacterBody2D:
			return explode_state
	parent.velocity.y += gravity * delta	
	parent.move_and_slide()
	return null
