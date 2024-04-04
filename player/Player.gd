class_name Player
extends CharacterBody2D


@onready
var animations: AnimatedSprite2D = $AnimatedSprite2D

@onready
var state_machine: Node = $StateMachine

@onready
var weapon: Area2D = $Weapon

@onready
var cloneScene = preload('res://player/skills/clone.tscn')

var input_handler: Input_handler
@export
var double_dash_cooldown: int
var timer : Timer
var clone

func create_clone():
	timer = Timer.new()
	timer.one_shot = true
	add_child(timer)
	timer.start(double_dash_cooldown)
	clone = cloneScene.instantiate()
	clone.position = global_position
	add_sibling(clone)

func change_sprite_direction(movement):
	animations.flip_h = movement > 0
	weapon.animation_flip = movement < 0
	weapon.global_position.x = global_position.x + 20 if movement > 0 else global_position.x - 20
	

func _ready() -> void:
	input_handler = Input_handler.new()
	state_machine.init(self, animations, input_handler)

func _unhandled_input(event: InputEvent) -> void:
	state_machine.process_input(event)

func _physics_process(delta: float) -> void:
	if position.y > 2000:
		free()
		return
	if timer != null and timer.time_left == 0:
		input_handler.dash_clone_is_enable = true
		timer.free()
		clone.free()
	state_machine.process_physics(delta)

func _process(delta: float) -> void:
	state_machine.process_frame(delta)
