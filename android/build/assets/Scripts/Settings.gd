extends Control

func _ready():
	get_node("Return").grab_focus()

func _input(event):
	if event.is_action_pressed("ui_end"):
		get_tree().change_scene_to_file("res://Scenes/Menu.tscn")

func _on_return_pressed():
	get_tree().change_scene_to_file("res://Scenes/Menu.tscn")


func _on_option_button_item_selected(index: int):
	if index == 0:
		GlobalSettings.draw_distance = 180
	elif index == 1:
		GlobalSettings.draw_distance = 360
