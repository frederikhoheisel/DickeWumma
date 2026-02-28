extends Node3D


@export var rotation_speed: float = 10.0 
@export var enemys: Array[PackedScene]
@export var spawn_amount: int = 10
@export var spawn_interval: float = 2.0


var time: float = 0.0
var container: Node3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	container = get_tree().get_first_node_in_group("EnemyContainer")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Sprite3D.rotation.z += delta * rotation_speed
	
	time += delta
	if time >= spawn_interval:
		time = 0.0
		_spawn_enemy()
		spawn_amount -= 1
		
		if spawn_amount <= 0:
			self.queue_free()


func _spawn_enemy() -> void:
	var enemy_scene: CharacterBody3D = enemys[randi() % enemys.size()].instantiate()
	
	container.add_child(enemy_scene)
	
	enemy_scene.global_position = self.global_position \
		+ Vector3(randf_range(-5.0, 5.0), randf_range(-2.0, 2.0), randf_range(-5.0, 5.0))
	
	enemy_scene.look_at(-enemy_scene.global_position)
