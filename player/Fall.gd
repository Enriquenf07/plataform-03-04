extends State

@export
var idle_state: State
@export
var move_state: State
@export
var jump_state: State
@export
var dash_state: State
@export
var dash_clone_state: State

func process_input(event: InputEvent) -> State:
	if input_handler.double_jump():
		return jump_state
	if input_handler.dash():
		return dash_state
	if input_handler.dashClone():
		return dash_clone_state
	return null

func process_physics(delta: float) -> State:
	parent.velocity.y += gravity * delta

	var movement = Input.get_axis('move_left', 'move_right') * move_speed
	input_handler.change_direction(movement)
	if movement != 0:
		parent.change_sprite_direction(movement)
	parent.velocity.x = movement
	parent.move_and_slide()
	
	if parent.is_on_floor():
		if movement != 0:
			return move_state
		return idle_state
	return null
