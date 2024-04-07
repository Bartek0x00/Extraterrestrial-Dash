extends Level

func _ready():
	super._ready()
	$Background_1.position = position
	$Foreground_0.position = position
