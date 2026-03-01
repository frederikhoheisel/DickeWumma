extends CharacterBody3D


@export var speed: float = 2.0
@export var health: int = 10


func _ready() -> void:
	$CPUParticles3D.restart()


func _physics_process(delta: float) -> void:
	velocity += -self.global_position.normalized() * speed * delta
	
	velocity = clamp(velocity, Vector3.ZERO, -self.global_position.normalized() * speed)
	
	move_and_slide()


func take_damage(amount: int) -> void:
	health -= amount
	$Blood.restart()
	if health <= 0:
		die()
	
	velocity = self.global_position.normalized() * 5.0


func die() -> void:
	get_tree().get_first_node_in_group("HUD").update_score()
	self.queue_free()
