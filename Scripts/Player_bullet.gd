extends	Bullet
class_name Player_bullet

func _ready():
	super._ready()
	area_entered.connect(_on_area_entered)
	body_entered.connect(_on_body_entered)

func _on_area_entered(area: Area2D):
	queue_free()
	if area.is_in_group("Enemy"):
		if area.damage():
			Score.add_score(area.score)

func _on_body_entered(_body: Node2D):
	var explosion = preload("res://Scenes/Player_bullet_explosion.tscn").instantiate()
	explosion.position = global_position
	get_parent().add_child(explosion)
	queue_free()
