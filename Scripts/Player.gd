extends CharacterBody2D

@export var speed = 300.0
@export var jump_velocity = -300.0

# Get the global gravity used for other nodes
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var direction
var shoot_direction = 1
var left_bullet_scene = preload("res://Scenes/Bullet_left.tscn")
var right_bullet_scene = preload("res://Scenes/Bullet_right.tscn")

func _physics_process(delta):
	if Input.is_action_pressed("left"):
		direction = -1
		shoot_direction = -1
	elif Input.is_action_pressed("right"):
		direction = 1
		shoot_direction = 1
	else:
		direction = 0
		
	if not is_on_floor():
		velocity.y += gravity * delta

	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y = jump_velocity
		$Sprite.play("Jumping")

	if Input.is_action_just_pressed("ui_accept"):
		shoot(shoot_direction)

	if direction:
		velocity.x = direction * speed
		$Sprite.scale.x = direction
		$Collision.scale.x = direction
		$Sprite.play("Walking")
	elif velocity.y > -100:
		$Sprite.play("Standing")
		$Sprite.stop()
		velocity.x = move_toward(velocity.x, 0, speed)
	move_and_slide()

func shoot(shooting_direction):
	if shooting_direction < 0:
		var left_bullet = left_bullet_scene.instantiate()
		get_parent().add_child(left_bullet)
		left_bullet.position = (position - Vector2(30, -5))
	elif shooting_direction > 0:
		var right_bullet = right_bullet_scene.instantiate()
		get_parent().add_child(right_bullet)
		right_bullet.position = (position + Vector2(30, 5)) 
