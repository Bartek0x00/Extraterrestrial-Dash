extends Bullet
class_name Bullet_enemy

func _on_body_entered(body: Node):
	queue_free()
	if body.is_in_group("Player"):
		body.queue_free()
		Spawner.spawn(Vector2i(0, 0))
