extends Node3D


@export var rotation_speed: float = 10.0 
@export var enemys: Array[PackedScene]
@export var spawn_amount: int = 10
@export var spawn_interval: float = 2.0


var time: float = 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Sprite3D.rotation.z += delta * rotation_speed
	
	time += delta
	if time >= spawn_interval:
		time = 0.0
		_spawn_enemy()


func _spawn_enemy() -> void:
	var enemy_scene: CharacterBody3D = enemys[randi() % enemys.size()].instantiate()
	self.add_child(enemy_scene)
