extends Node2D
class_name Level

@export var initial_pos: Vector2i = Vector2i(0, 0)

func _ready():
	Spawner.spawn(initial_pos)
