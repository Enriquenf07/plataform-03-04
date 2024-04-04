extends "res://state/state.gd"

@export
var idle_state: State
@export
var jump_state: State
@export
var fall_state: State
@export
var dash_state: State

func enter():
	super()
	if parent.is_on_floor():
		input_handler.set_double_jump(true)
		input_handler.dash_is_enable = true

func process_physics(delta: float) -> State:
	if parent.velocity.y > 0:
		return fall_state
	if input_handler.jump() and parent.is_on_floor():
		return jump_state
	if input_handler.dash():
		return dash_state
		
	parent.velocity.y += gravity * delta

	var movement = Input.get_axis('move_left', 'move_right') * move_speed
	
	if movement == 0:
		return idle_state
	
	parent.change_sprite_direction(movement)
	
	input_handler.change_direction(movement)
	parent.velocity.x = movement
	parent.move_and_slide()
	
	return null
