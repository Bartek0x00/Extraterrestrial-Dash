extends Node

var player_scene = preload("res://Scenes/Player.tscn")

func spawn(position: Vector2i, scene: PackedScene = player_scene):
	call_deferred("_spawn", position, scene)

func _spawn(position: Vector2i, scene: PackedScene = player_scene):
	var instance = scene.instantiate()
	instance.position = position
	get_window().add_child(instance)
