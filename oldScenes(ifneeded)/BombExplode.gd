extends RayCast2D

@onready var casting_particles: GPUParticles2D = $CastingParticles
@onready var collision_particles: GPUParticles2D = $CollisionParticles
@onready var beam_particles: GPUParticles2D = $BeamParticles

	
func _ready():
	#SET POS AND ROTATIONS MK
	casting_particles.global_position = self.global_position
	#collision_particles.global_position = self.global_position
	beam_particles.global_position = self.global_position	
	$Line2D.global_position = self.global_position
	#rotate
	casting_particles.global_rotation = self.global_rotation
	#collision_particles.global_rotation = self.global_rotation
	beam_particles.global_rotation = self.global_rotation	
	$Line2D.global_rotation = self.global_rotation
	casting_particles.emitting = true
	#(collision_particles.global_position)
func _physics_process(delta):
	var cast_point := target_position
	var cast_point2 := target_position		
	if is_colliding():
		cast_point = to_local(get_collision_point())				
		#cast_point2= get_collision_point()
		##print((get_collision_point()))
		#casting_particles.process_material.initial_velocity_max = cast_point.x #if you want to make particle spread based
		#collision_particles.global_rotation = get_collision_normal().angle()   #on LineDistance make unique particles 
		#collision_particles.position = cast_point2                             #for eachside, processmat is sameforall 
		#if !collision_particles.emitting:
			#collision_particles.emitting = true
		#print(collision_particles.global_position)
	
	$Line2D.points[1] = cast_point	

	var tween = create_tween()
	tween.tween_property($Line2D, "width", 0.0, 0.2	)
	var tween2 = create_tween()
	tween2.tween_property($Line2D, "modulate:a", 0.0, 0.2	)		
	
 	
