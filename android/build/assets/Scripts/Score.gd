extends Node

const MAX_LEVEL: int = 0
var level: int = 0
var score: int = 0

func add_score(amount: int):
	if score + amount < 100:
		score += amount
		return
		
	score = 0
	if level < MAX_LEVEL:
		level += 1
		return
		
	level = 0
	get_tree().get_nodes_in_group("Player")[0].queue_free()
	get_tree().change_scene_to_file("res://Scenes/Final.tscn")
