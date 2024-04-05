extends	Bullet

@export var damage: int = 1

func _on_body_entered(body: Node):
	queue_free()
	if body.is_in_group("Enemy"):
		if body.damage(damage):
			Score.add_score(body.score)
