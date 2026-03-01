extends Node3D


@export var initial_interval: float = 10.0


var portal: PackedScene = preload("res://src/portale/portal.tscn")
var time: float = 0.0


func _ready() -> void:
	_spawn_portal()


func _process(delta: float) -> void:
	time += delta
	
	if time >= initial_interval:
		time = 0.0
		_spawn_portal()
		initial_interval *= 0.8


func _spawn_portal() -> void:
	var portal_scene: Node3D = portal.instantiate()
	
	self.add_child(portal_scene)
	
	portal_scene.global_position = _get_portal_pos()
	portal_scene.look_at(-portal_scene.global_position)


func _get_portal_pos() -> Vector3:
	var pos: Vector3 = Vector3(randf_range(-30.0, 30.0), randf_range(2.0, 5.0), randf_range(-10.0, -60.0))
	
	while (-pos.z) > abs(pos.x):
		pos = Vector3(randf_range(-30.0, 30.0), randf_range(2.0, 5.0), randf_range(-10.0, -60.0))
	
	return pos
