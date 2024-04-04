extends "res://state/state.gd"

@export
var jump_state: State
@export
var move_state: State
@export
var dash_state: State

func enter() -> void:
	super()
	input_handler.set_double_jump(true)
	input_handler.dash_is_enable = true
	parent.velocity.x = 0

func process_input(event: InputEvent) -> State:
	if input_handler.dash():
		return dash_state
	if Input.get_axis('move_left', 'move_right'): 
		return move_state
	if input_handler.jump() and parent.is_on_floor():
		return jump_state
	return null

func process_physics(delta: float) -> State:
	parent.velocity.y += gravity * delta
	parent.move_and_slide()
	return null
