extends Node3D


@export var enemy: CharacterBody3D
@export var weakspot_interval: float = 5.0
@export var spawn_radius: float = 0.5
@export var spawn_time_randomness: float = 3.0


var next_time: float
var time: float = 0.0
var weakspot: PackedScene = preload("res://src/enemies/weakspot.tscn")


func _ready() -> void:
	next_time = weakspot_interval + randf_range(-spawn_time_randomness, spawn_time_randomness)


func _process(delta: float) -> void:
	time += delta
	
	if time >= next_time and self.get_children().size() < 3:
		next_time = weakspot_interval + randf_range(-spawn_time_randomness, spawn_time_randomness)
		time = 0.0
		_spawn_weakspot()


func _spawn_weakspot() -> void:
	var weakspot_scene: WeakSpot = weakspot.instantiate()
	
	weakspot_scene.hit.connect(enemy.take_damage)
	weakspot_scene.position = Vector3(randf_range(-spawn_radius, spawn_radius), randf_range(-spawn_radius, spawn_radius), 0.0)
	self.add_child(weakspot_scene)
	
