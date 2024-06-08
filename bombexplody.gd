extends Node2D

@onready var bomb = get_parent()

func _ready():	
	$GPUParticles2D.emitting = true 
	$GPUParticles2D/GPUParticles2D2.emitting = true
	



func _on_area_2d_body_entered(body):
	if body.has_method("take_damage"):	
		if body.is_in_group("player") && !bomb.isAlreadyDamagedToPlayer:
			bomb.isAlreadyDamagedToPlayer=true
			body.take_damage()
		elif body.is_in_group("player") && bomb.isAlreadyDamagedToPlayer:
			pass
		else:
			body.take_damage()	
