extends Enemy
class_name Enemy_shooter

@export var shoot_cooldown = 2

func _ready():
	super._ready()
	var timer = Timer.new()
	timer.wait_time = shoot_cooldown
	timer.timeout.connect(shoot)
	add_child(timer)
	timer.start()

func shoot():
	_shoot(direction)

func _shoot(shoot_direction: int):
	if not $Shape/ShapeCast.is_colliding():
		var bullet = load("res://Scenes/" + get_name() + "_bullet.tscn").instantiate()
		bullet.position = $Shape/Marker.global_position
		bullet.direction = shoot_direction
		get_window().add_child(bullet)
