extends RayCast2D

var testOfHowmanyBombs:int = 2



func _physics_process(delta):
	target_position = Vector2(Global.explosionSizeUnit*64,0)
	
	var cast_point := target_position	
	if is_colliding():
		cast_point = to_local(get_collision_point())
		testOfHowmanyBombs = cast_point.x/64
		#print(cast_point)
	else:
		testOfHowmanyBombs = target_position.x/64
