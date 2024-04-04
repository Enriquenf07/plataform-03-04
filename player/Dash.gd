extends State
class_name Dash

@export
var dash_power : int
@export
var dash_frames : int
@export
var idle_state : State
@export
var move_state : State
@export
var jump_state : State

var actual_frame : int

func enter():
	super()
	parent.weapon.is_attack_disabled = true
	actual_frame = 0
	parent.velocity.y = 0
	if parent.velocity.x == 0 and input_handler.last_direction == 'left':
		parent.velocity.x = -move_state.move_speed * dash_power
		return
	if parent.velocity.x == 0 and input_handler.last_direction == 'right':
		parent.velocity.x = move_state.move_speed * dash_power
		return
	parent.velocity.x = parent.velocity.x * dash_power

func exit():
	parent.weapon.is_attack_disabled = false
	
func process_input(event: InputEvent):
	if input_handler.jump() and parent.is_on_floor():
		return jump_state
	return null

func process_physics(delta):
	actual_frame += 1
	
	parent.move_and_slide()
	if actual_frame >= dash_frames:
		var movement = Input.get_axis('move_left', 'move_right') * move_speed
		if movement == 0:
			return idle_state
		return move_state
	return null
