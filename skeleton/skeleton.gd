extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready
var animations: AnimatedSprite2D = $AnimatedSprite2D

@onready
var state_machine: Node = $StateMachine

@onready
var health: IHealth = $Health

@onready
var on_hit_state: State = $StateMachine/OnHit


func hit(damage, direction):
	on_hit_state.damage = damage
	on_hit_state.comeback_direction = direction
	state_machine.change_state(on_hit_state)

func change_sprite_direction(movement):
	animations.flip_h = movement > 0

func _ready() -> void:
	health.init(self)
	state_machine.init(self, animations, Input_handler.new())

func _unhandled_input(event: InputEvent) -> void:
	state_machine.process_input(event)

func _physics_process(delta: float) -> void:
	state_machine.process_physics(delta)

func _process(delta: float) -> void:
	state_machine.process_frame(delta)


