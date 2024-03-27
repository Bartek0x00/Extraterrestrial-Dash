extends CharacterBody2D
class_name Enemy

var score: int = 25
var speed: int = 50
var direction: int = 1

func _physics_process(delta):
	position += Vector2((direction * speed * delta), 0)
