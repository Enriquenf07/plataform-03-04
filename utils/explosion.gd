extends Area2D

var damage

@onready
var animations = $AnimatedSprite2D
# Called when the node enters the scene tree for the first time.
func _ready():
	animations.play('default')

			

func _process(delta):
	for body in get_overlapping_bodies():
		var children = body.get_children()
		for child in children:
			print(child)
			if child is IHealth:
				child.handle_damage(damage)
	if !animations.is_playing():
		free()
