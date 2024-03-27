extends CharacterBody2D

var direction: int = 1
var speed: int = 200

func _physics_process(delta):
	position += Vector2((direction * speed * delta), 0)

func _on_body_entered(body):
	if body.is_in_group("Env"):
		direction *= -1
