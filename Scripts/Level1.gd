extends Node2D

func _ready():
	var player = preload("res://Scenes/Player.tscn").instantiate()
	get_tree().get_root().add_child(player)
