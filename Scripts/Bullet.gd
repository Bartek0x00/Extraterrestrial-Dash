extends Area2D

var direction = 1
var speed = 500

func _ready():
	$Sprite.scale.x = direction
	$Collision.scale.x = direction

func _physics_process(delta):
	position += Vector2((direction * speed * delta), 0)

func _on_body_entered(body):
	queue_free()

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
