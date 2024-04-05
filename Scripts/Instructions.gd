extends Control

func _ready():
	$Accept.grab_focus()
	$Label.text = "You need 100 points to get to the next level.
		There are %s levels.
		If a enemy hits or strikes you, you get teleported here.
		You need to kill the enemies to get the points." % str(Score.level + 1)

func _on_accept_pressed():
	get_tree().change_scene_to_file("res://Scenes/Level" + str(Score.level) + ".tscn")
