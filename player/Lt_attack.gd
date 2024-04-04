extends State

@export
var disable_state: State

@export
var damage: float

func enter():
	super()
	animations.frame_progress = 0
	animations.visible = true
	parent.hitbox.disabled = false

func process_physics(delta: float) -> State:
	animations.flip_h = parent.animation_flip
	if parent.has_overlapping_bodies():
		for bodie in parent.get_overlapping_bodies():
			if bodie.has_method('hit'):
				bodie.hit(damage, 1 if parent.animation_flip else -1)
		return disable_state
	if !animations.is_playing():
		return disable_state
	return null
		
