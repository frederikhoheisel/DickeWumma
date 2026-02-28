extends CharacterBody3D


@export var speed: float = 0.5
@export var health: int = 10


func _physics_process(_delta: float) -> void:
	velocity = -self.global_position.normalized() * speed

	move_and_slide()


func take_damage(amount: int) -> void:
	health -= amount
	if health <= 0:
		die()


func die() -> void:
	pass
