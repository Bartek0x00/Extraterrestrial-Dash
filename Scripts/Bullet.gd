extends CharacterBody2D

const SPEED = 500

var direction = Vector2.RIGHT

func _ready():
	velocity = direction * SPEED

func _physics_process(delta):
	move_and_slide()

func set_direction(new_direction: Vector2) -> void:
	direction = new_direction
	velocity = direction * SPEED

