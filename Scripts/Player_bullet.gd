extends	Bullet

func _on_body_entered(body: Node):
	queue_free()
	if body.is_in_group("Enemy"):
		Score.add_score(body.score)
		body.get_parent().get_parent().queue_free()
