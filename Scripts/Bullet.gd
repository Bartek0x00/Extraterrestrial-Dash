extends Area2D

@export var bullet_direction = 1
@export var bullet_speed = 200

func _physics_process(delta):
	position += Vector2((bullet_direction * bullet_speed * delta), 0)

func _on_body_entered(body):
	print(body)
	queue_free()

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
