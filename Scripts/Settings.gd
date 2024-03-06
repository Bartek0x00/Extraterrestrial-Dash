extends Control

func _ready():
	get_node("ButtonSound").grab_focus()

func _input(event):
	if event.is_action_pressed("ui_end"):
		get_tree().change_scene_to_file("res://Scenes/Menu.tscn")
