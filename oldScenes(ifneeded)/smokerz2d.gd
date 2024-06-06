extends CharacterBody2D
const DEFAULT_SPEED :int = 100
var test :float = 0.0
func _ready():
	$GPUParticles2D.emitting = true
	
func _physics_process(delta):
	
	if test < 10.0:	
		var direction = global_position.direction_to(Vector2(0,0))
		velocity = direction * DEFAULT_SPEED			
		move_and_collide(velocity * delta)
	else:
		pass
	test +=delta
	
