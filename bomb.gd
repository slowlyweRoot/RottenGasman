extends Node2D
var value : float = 1.0

func _process(delta):
	#$Sprite2D.material.set_shader_parameter("detonatetimer", value)
	pass


func _on_timer_timeout():
	#BOMB EFFECT SPEED INCREASE MY WAY
	value+=2
	if value > 30:
		queue_free()
		explode()	
	#BOMB EFFECT SPEED INCREASE WITH TWEEN
	var tween = get_tree().create_tween();
	tween.tween_method(
	func(value): $Sprite2D.material.set_shader_parameter("detonatetimer", value),  
	 1.0,  # Start value
	  10.0,  # End value
	  5     # Duration
	);
	
func explode():
	pass # add animation and instantiate projectile here
