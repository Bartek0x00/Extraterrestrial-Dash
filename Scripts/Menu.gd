extends Control

func _ready():
	get_node("Start").grab_focus()
	if OS.get_name() == "Web":
		OS.set_restart_on_exit(true)
		Window.MODE_MAXIMIZED

func _input(event):
	if event.is_action_pressed("ui_end"):
		get_tree().quit()

func _on_Start_pressed():
	get_tree().change_scene_to_file("res://Scenes/Instructions.tscn")
	Score.score = 0

func _on_Options_pressed():
	get_tree().change_scene_to_file("res://Scenes/Settings.tscn")

func _on_Quit_pressed():
	get_tree().quit()
