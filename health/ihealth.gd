extends Node
class_name IHealth
@export
var value: float 

var parent: Node

func handle_damage(damage: float):
	self.value -= damage

func die():
	pass

func _physics_process(delta):
	if value <= 0:
		die()

func init(parent):
	self.parent = parent
	
