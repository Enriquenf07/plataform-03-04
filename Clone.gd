extends CharacterBody2D

@onready
var animations: AnimatedSprite2D = $AnimatedSprite2D

@onready
var state_machine: Node = $State_machine

func change_sprite_direction(movement):
	animations.flip_h = movement > 0

func _ready() -> void:
	state_machine.init(self, animations, Input_handler.new())

func _unhandled_input(event: InputEvent) -> void:
	state_machine.process_input(event)

func _physics_process(delta: float) -> void:
	if position.y > 2000:
		free()
		return
	state_machine.process_physics(delta)

func _process(delta: float) -> void:
	state_machine.process_frame(delta)
