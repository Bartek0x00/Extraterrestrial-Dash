extends Node2D
class_name Level

func spawn(scene: PackedScene, coord: Vector2i) -> void:
	var entity = scene.instantiate()
	entity.position = coord
	get_window().add_child(entity)
