extends Area2D
class_name Bullet

var direction: int = 1
@export var speed: int = 500

func _ready():
	$Sprite.scale.x = direction
	$Shape.scale.x = direction
	$Notifier.screen_exited.connect(_on_notifier_screen_exited)

func _physics_process(delta: float):
	position.x += direction * speed * delta

func _on_notifier_screen_exited():
	queue_free()
