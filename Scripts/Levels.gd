extends Node2D
class_name Level

func create_player(coord: Vector2i) -> void:
	var player = preload("res://Scenes/Player.tscn").instantiate()
	player.position = coord
	get_window().add_child(player)
