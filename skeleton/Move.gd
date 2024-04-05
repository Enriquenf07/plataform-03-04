extends State

var time: float = 0
var direction = 1
@export
var acceleration: float = 0.3

func enter():
	super()

func process_physics(delta: float) -> State:
	animations.flip_h = parent.velocity.x > 0
	var actual_velocity = parent.velocity.x
	if !parent.is_on_floor():
		parent.velocity.y += gravity * delta
	if int(time) % 10 == 0:
		time += 1
		acceleration *= -1
	if parent.is_on_floor() and +parent.velocity.x <= +move_speed:
		parent.velocity.x += acceleration if acceleration * actual_velocity > 0 else acceleration * 10
	time += delta
	parent.move_and_slide()
	return null
