extends State

@export
var lt_attack_state: State

func enter():
	animations.visible = false
	parent.hitbox.disabled = true

func process_input(event: InputEvent) -> State:
	if Input.is_action_just_pressed('lt_attack') and !parent.is_attack_disabled:
		return lt_attack_state
	return null

