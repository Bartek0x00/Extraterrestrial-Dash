extends CharacterBody2D

@export var speed = 300.0
@export var jump_velocity = -300.0

var gravity = 980
var direction = 0
var shoot_direction = 1
var bullet_scene = preload("res://Scenes/Bullet.tscn")
var mobile_ui_scene = preload("res://Scenes/Mobile_UI.tscn")
var pause_menu_scene = preload("res://Scenes/Pause_menu.tscn")
var pause_menu

func _ready():
	if OS.get_name() == "Android" or "Web":
		$Camera2D.add_child(mobile_ui_scene.instantiate())

func _physics_process(delta):
	if Input.is_action_pressed("left"):
		direction = -1
		shoot_direction = -1
	elif Input.is_action_pressed("right"):
		direction = 1
		shoot_direction = 1
	else:
		direction = 0

	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y = jump_velocity
		$Sprite.play("Jumping")

	if Input.is_action_just_pressed("shoot"):
		shoot(shoot_direction)

	if Input.is_action_just_pressed("escape"):
		pause_game()

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
	if not $Collision/RayCast.is_colliding():
		var bullet = bullet_scene.instantiate()
		bullet.position = $Collision/Marker.global_position
		bullet.direction = shooting_direction
		get_parent().add_child(bullet)

func pause_game():
	get_tree().paused = true
	pause_menu = pause_menu_scene.instantiate()
	$Camera2D.add_child(pause_menu)

func resume_game():
	get_tree().paused = false
	$Camera2D.remove_child(pause_menu)
	direction = 0
