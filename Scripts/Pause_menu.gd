extends Control

func _ready():
	$ColorRect/Resume.grab_focus()

func _on_resume_pressed():
	get_parent().get_parent().resume_game()

func _on_save_pressed():
	get_tree().change_scene_to_file("res://Scenes/Menu.tscn")
	get_tree().paused = false
	get_parent().get_parent().queue_free()

func _on_quit_pressed():
	get_tree().quit()
