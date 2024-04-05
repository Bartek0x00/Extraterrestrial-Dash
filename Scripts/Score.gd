extends Node

const MAX_LEVEL: int = 1
var level: int = 1
var score: int = 0

func add_score(amount: int):
	if score + amount < 100:
		score += amount
		return
		
	score = 0
	get_tree().get_nodes_in_group("Player")[0].queue_free()
	if level < MAX_LEVEL:
		level += 1
		get_tree().change_scene_to_file("res://Scenes/Level" + str(level) + ".tscn")
	else:
		get_tree().change_scene_to_file("res://Scenes/Final.tscn")
