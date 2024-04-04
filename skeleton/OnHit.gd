extends State
@export
var idle_state: State

var damage: float
var comeback_direction = 1



func enter() -> void:
	super()
	parent.health.handle_damage(damage)
	parent.velocity.y = -200 
	parent.velocity.x = -100 * comeback_direction
	parent.move_and_slide()

func exit() -> void:
	pass

func process_input(event: InputEvent) -> State:
	return null

func process_frame(delta: float) -> State:
	return idle_state

func process_physics(delta: float) -> State:
	return idle_state
