extends RigidBody2D
class_name Enemy

@export var speed: int = 100
var direction: int = 1
var old_pos: Vector2 = Vector2.ZERO
@export var score: int = 0
@export var max_health: int = 1
var health: int
var health_bar

func _ready():
	add_to_group("Enemy")
	$Sprite.play("Walk")
	body_entered.connect(_on_body_entered)
	var enabler = VisibleOnScreenEnabler2D.new()
	enabler.rect = Rect2(
		-GlobalSettings.draw_distance, 
		-(0.8 * GlobalSettings.draw_distance),
		2 * GlobalSettings.draw_distance,
		GlobalSettings.draw_distance
	)
	add_child(enabler)
	health_bar = preload("res://Scenes/Health_bar.tscn").instantiate()
	health_bar.max_value = max_health
	add_child(health_bar)
	health = max_health

func _physics_process(delta: float) -> void:
	var new_pos: Vector2 = global_position
	if (new_pos.x - old_pos.x) > 0:
		direction = 1
	else:
		direction = -1
	$Sprite.scale.x = direction
	$Shape.scale.x = direction
	get_parent().progress += speed * delta
	old_pos = new_pos

func _on_body_entered(body: Node) -> void:
	if body.is_in_group("Player"):
		body.queue_free()
		Spawner.spawn(Vector2i(0, 0))

func damage(amount: int) -> int:
	if health - amount > 0:
		health -= amount
		health_bar.value = health
		return 0
	else:
		queue_free()
		return 1
