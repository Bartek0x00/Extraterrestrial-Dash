extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -300.0

# Get the global gravity used for other nodes
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var sprite
var bullet_scene = preload("res://Scenes/Bullet.tscn")

func _ready():
	sprite = $AnimatedSprite2D

func _physics_process(delta):
	var direction = Input.get_axis("left", "right")
	if not is_on_floor():
		velocity.y += gravity * delta

	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		sprite.play("Jumping")

	if Input.is_action_just_pressed("ui_accept"):
		shoot(direction)
	if direction:
		velocity.x = direction * SPEED
		if direction > 0:
			sprite.flip_h = false
			sprite.play("Walking")
		if direction < 0:
			sprite.flip_h = true
			sprite.play("Walking")
	elif velocity.y > -100:
		sprite.play("Standing")
		sprite.stop()
		velocity.x = move_toward(velocity.x, 0, SPEED)
	move_and_slide()

func shoot(direction):
	var bullet = bullet_scene.instantiate()
	if direction:
		bullet.set_direction(Vector2.RIGHT)
		bullet.position = position + Vector2(30, 0)
	else:
		bullet.set_direction(Vector2.LEFT)
		bullet.position = position + Vector2(-30, 0)
	get_parent().add_child(bullet)
