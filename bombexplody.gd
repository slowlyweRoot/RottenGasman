extends Node2D

func _ready():	
	$GPUParticles2D.emitting = true
	



func _on_area_2d_body_entered(body):
	if body.has_method("take_damage"):	
		body.take_damage()
