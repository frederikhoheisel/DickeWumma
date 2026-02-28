extends CharacterBody3D


@export var speed: float = 2.0
@export var health: int = 10


#func _ready() -> void:
	#self.look_at(-self.global_position)


func _physics_process(_delta: float) -> void:
	velocity = -self.global_position.normalized() * speed

	move_and_slide()


func take_damage(amount: int) -> void:
	health -= amount
	if health <= 0:
		die()


func die() -> void:
	get_tree().get_first_node_in_group("HUD").update_score()
	self.queue_free()
