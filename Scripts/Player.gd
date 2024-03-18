extends CharacterBody2D

@export var speed = 300.0
@export var jump_velocity = -300.0

var gravity = 980
var direction = 0
var shoot_direction = 1
var left_bullet_scene = preload("res://Scenes/Bullet_left.tscn")
var right_bullet_scene = preload("res://Scenes/Bullet_right.tscn")
var mobile_ui_scene = preload("res://Scenes/Mobile_UI.tscn")
var pause_menu_scene = preload("res://Scenes/Pause_menu.tscn")
var pause_menu

func _ready():
	if OS.get_name() == "Android":
		$Camera2D.add_child(mobile_ui_scene.instantiate())

func _input(event):
	if event.is_action("left"):
		direction = -1
		shoot_direction = -1
	elif event.is_action("right"):
		direction = 1
		shoot_direction = 1

	if event.is_action("jump") and is_on_floor():
		velocity.y = jump_velocity
		$Sprite.play("Jumping")

	if event.is_action_pressed("escape"):
		pause_game()

	if event.is_action_pressed("shoot"):
		shoot(shoot_direction)

func _unhandled_input(event):
	if event.is_action_released("left") or event.is_action_released("right"):
		direction = 0

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta

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

func pause_game():
	get_tree().paused = true
	pause_menu = pause_menu_scene.instantiate()
	$Camera2D.add_child(pause_menu)

func resume_game():
	get_tree().paused = false
	$Camera2D.remove_child(pause_menu)
	direction = 0
