extends Control

func _ready():
	$Github.grab_focus()

func _on_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/Menu.tscn")

func _on_github_pressed():
	OS.shell_open("https://github.com/Bartek0x00/Extraterrestrial-Dash")
