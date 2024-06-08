extends StaticBody2D

func _physics_process(delta):
	if !(scale.x < 0.1):
		scale += Vector2(-0.001,-0.001)
	



