extends Area2D
class_name melee_attack

@export
var damage: float
	
@onready
var animations: AnimatedSprite2D = $Weapon_animations

@onready
var state_machine: Node = $Melee_machine

@onready
var hitbox: CollisionShape2D = $CollisionShape2D

var animation_flip = true

var is_attack_disabled = false


func _ready() -> void:
	state_machine.init(self, animations, Input_handler.new())

func _unhandled_input(event: InputEvent) -> void:
	state_machine.process_input(event)

func _physics_process(delta: float) -> void:
	state_machine.process_physics(delta)

func _process(delta: float) -> void:
	state_machine.process_frame(delta)
