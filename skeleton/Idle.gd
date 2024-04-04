extends State

@export
var on_hit_state: State

func process_input(event: InputEvent) -> State:
	return null

func process_physics(delta: float) -> State:
	if parent.is_on_floor():
		parent.velocity.x = 0
	parent.velocity.y += gravity * delta
	parent.move_and_slide()
	return null
