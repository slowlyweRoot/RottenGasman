extends RayCast2D

var testOfHowmanyBombs = 2


func _physics_process(delta):
	
	var cast_point := target_position	
	if is_colliding():
		cast_point = to_local(get_collision_point())
		testOfHowmanyBombs = cast_point.x/32
		#print(cast_point)
	else:
		testOfHowmanyBombs = target_position.x/32
