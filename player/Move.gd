extends "res://state/state.gd"

@export
var idle_state: State
@export
var jump_state: State
@export
var fall_state: State

func enter():
	super()
	input_handler.set_double_jump(true)

func process_physics(delta: float) -> State:
	if parent.velocity.y > 0:
		return fall_state
	if input_handler.jump() and parent.is_on_floor():
		return jump_state
	
	parent.velocity.y += gravity * delta

	var movement = Input.get_axis('move_left', 'move_right') * move_speed
	
	if movement == 0:
		return idle_state
	
	animations.flip_h = movement > 0
	parent.velocity.x = movement
	parent.move_and_slide()
	
	return null
