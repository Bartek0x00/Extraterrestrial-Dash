extends Bullet
class_name Bullet_enemy

@export var hasAnimatedExplosion: bool = false

func _ready():
	super._ready()
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node):
	if body.is_in_group("Player"):
		body.queue_free()
		Spawner.spawn(Vector2i(0, 0))
	elif hasAnimatedExplosion:
		var explosion = load("res://Scenes/" + str(get_name()) + "_explosion.tscn").instantiate()
		explosion.position = global_position
		get_parent().add_child(explosion)
	queue_free()
