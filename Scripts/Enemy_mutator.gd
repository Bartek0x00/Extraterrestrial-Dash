extends Enemy
class_name Enemy_mutator

@export var speed_arr: Array[int]

func move(delta):
	get_parent().progress += speed_arr[health - 1] * delta

func damage() -> int:
	if health - 1 > 0:
		health -= 1
		health_bar.value = health
		$Sprite.play("Walk" + str(health))
		return 0
	else:
		queue_free()
		return 1
