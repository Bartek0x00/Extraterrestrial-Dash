extends Control

func _ready():
	get_node("Start").grab_focus()

func _input(event):
	if event.is_action_pressed("ui_end"):
		get_tree().quit()

func _on_Start_pressed():
	get_tree().change_scene_to_file("res://Scenes/Level0.tscn")

func _on_Options_pressed():
	get_tree().change_scene_to_file("res://Scenes/Settings.tscn")

func _on_Quit_pressed():
	get_tree().quit()
