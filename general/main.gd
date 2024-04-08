extends Node2D
@onready
var skeletonScene  = preload("res://skeleton/skeleton.tscn")

var timer
var last_sec

@onready
var playerScene = preload("res://player/Player.tscn")

@onready
var life_object = preload("res://objects/life_object.tscn")

var player
var rng := RandomNumberGenerator.new()

@export
var max_objects: int

var current_objects := 0


func create_player():
	player = playerScene.instantiate()
	player.position = Vector2(328, 157)
	add_child(player)

func _ready():
	create_player()
	timer = Timer.new()
	add_child(timer)
	timer.wait_time = 100
	last_sec = timer.wait_time + 1
	timer.start()

func _process(delta):
	if !player:
		create_player()
	var time_left = (int(timer.time_left))
	if time_left % 10 == 0 and last_sec != time_left:
		var instance = skeletonScene.instantiate()
		instance.position = Vector2(rng.randf_range(200, 1200), 463)
		add_child(instance)
	if current_objects < max_objects and time_left % 10 == 0 and last_sec != time_left:
		var object = life_object.instantiate()
		object.position = Vector2(rng.randf_range(200, 1200), rng.randf_range(300, -100))
		add_child(object)
	last_sec = time_left
