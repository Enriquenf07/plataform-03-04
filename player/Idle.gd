extends "res://state/state.gd"

@export
var jump_state: State
@export
var move_state: State

func enter() -> void:
	super()
	input_handler.set_double_jump(true)
	parent.velocity.x = 0

func process_input(event: InputEvent) -> State:
	if Input.get_axis('move_left', 'move_right'): 
		return move_state
	if input_handler.jump() and parent.is_on_floor():
		return jump_state
	return null

func process_physics(delta: float) -> State:
	parent.velocity.y += gravity * delta
	parent.move_and_slide()
	return null
