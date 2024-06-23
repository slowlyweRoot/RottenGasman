extends CharacterBody2D

func _physics_process(delta):
	if !(scale.x < 0.1):
		scale += Vector2(-0.001,-0.001)
		
func _on_main_circle_body_exited(body):
	if body.is_in_group("player"):
		body.isOutsideCircle = true


func _on_main_circle_body_entered(body):
	if body.is_in_group("player"):
		body.isOutsideCircle = false
