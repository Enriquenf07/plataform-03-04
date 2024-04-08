extends CharacterBody2D

@export
var power: float

var used := false

var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")

func exec(player: CharacterBody2D):
	if not used:
		player.health.value += power
		used = true
	queue_free()

func _physics_process(delta):
	velocity.y += gravity * delta
	move_and_slide()
