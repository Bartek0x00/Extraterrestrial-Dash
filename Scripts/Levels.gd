extends Node2D
class_name Level

func _ready():
	Spawner.spawn(Vector2i(0, 0))
