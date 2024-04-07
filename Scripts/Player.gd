extends CharacterBody2D

@export var speed = 300.0

var jump_velocity = -300.0
var gravity = 980
var direction = 0
var shoot_direction = 1
var bullet_scene = preload("res://Scenes/Player_bullet.tscn")

func _ready():
	if OS.get_name() == "Web" or OS.get_name() == "Android":
		$Camera/Mobile_UI.show()
	add_to_group("Player")

func _physics_process(delta):
	$Camera/Label.text = "Score %s/100" % Score.score
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
		$Shape.scale.x = direction
		$Sprite.play("Walking")
	elif velocity.y > -100:
		$Sprite.play("Standing")
		$Sprite.stop()
		velocity.x = move_toward(velocity.x, 0, speed)
	move_and_slide()

func shoot(shooting_direction: int) -> void:
	if not $Shape/ShapeCast.is_colliding():
		var bullet = bullet_scene.instantiate()
		bullet.position = $Shape/Marker.global_position
		bullet.direction = shooting_direction
		get_parent().add_child(bullet)

func pause_game() -> void:
	get_tree().paused = true
	$Camera/Pause_menu.show()
	$Camera/Pause_menu/ColorRect/Resume.grab_focus()

func resume_game() -> void:
	get_tree().paused = false
	$Camera/Pause_menu.hide()
	direction = 0
