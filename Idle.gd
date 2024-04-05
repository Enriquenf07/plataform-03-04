extends State

@export
var explode_state: State

func process_physics(delta):
	parent.velocity.y += gravity * delta	
	parent.move_and_slide()
	return null
