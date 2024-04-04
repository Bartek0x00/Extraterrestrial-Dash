extends Node

func _input(event):
	if event.is_action_pressed("ui_f12"):
		toggle_screen_mode()

func toggle_screen_mode():
	match DisplayServer.window_get_mode():
		DisplayServer.WINDOW_MODE_MAXIMIZED:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		DisplayServer.WINDOW_MODE_WINDOWED:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_MAXIMIZED)
