extends RigidBody2D
class_name Enemy

var speed: int = 100
var direction: int = 1
var old_pos: Vector2 = Vector2.ZERO
var score: int = 0


func _ready():
	add_to_group("Enemy")
	$Sprite.play("Walk")
	self.body_entered.connect(_on_body_entered)

func _physics_process(delta: float):
	var new_pos: Vector2 = global_position
	if (new_pos.x - old_pos.x) > 0:
		direction = 1
	else:
		direction = -1
	$Sprite.scale.x = direction
	$Shape.scale.x = direction
	get_parent().progress += speed * delta
	old_pos = new_pos

func _on_body_entered(body: Node):
	queue_free()
	if body.is_in_group("Player"):
		body.queue_free()

