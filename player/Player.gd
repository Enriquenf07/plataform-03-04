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
@export
var jump_state: State
@onready
var health := %Health

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
	
func hit(dmg, direction):
	%Health.handle_damage(dmg)
	velocity.x = -100 * direction
	move_and_slide()
	state_machine.change_state(jump_state)
	jump_state.comeback = direction

func _ready() -> void:
	input_handler = Input_handler.new()
	state_machine.init(self, animations, input_handler)
	%Hud.init(%Health)
	
func _unhandled_input(event: InputEvent) -> void:
	state_machine.process_input(event)

func _physics_process(delta: float) -> void:
	if position.y > 2000:
		%Health.die()
		return
	for index in range(get_slide_collision_count()):
		var collision = get_slide_collision(index)
		var body = collision.get_collider()
		if body is CharacterBody2D:
			if body.is_in_group('objects'):
				body.exec(self)
	if timer != null and timer.time_left == 0:
		input_handler.dash_clone_is_enable = true
		timer.free()
		if clone != null:
			clone.free()
	state_machine.process_physics(delta)

func _process(delta: float) -> void:
	state_machine.process_frame(delta)
