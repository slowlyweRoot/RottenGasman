extends Node2D
var value : float = 1.0
var value2 : float = 1.0
var detonateTime : int = 5
var isDetonated :bool=false

func _process(delta):
	#$Sprite2D.material.set_shader_parameter("detonatetimer", value2)
	pass
	
	
	

func _on_timer_timeout():
	#$StaticBody2D.set_collision_layer_value(1,true)
	#BOMB EFFECT SPEED INCREASE MY WAY
	# print(str($Sprite2D.material.get_shader_parameter("detonatetimer"))+"&&" + self.name)
	$Sprite2D.material.set_shader_parameter("detonatetimer", value2)
	value2+=2
	if value2 > detonateTime && !isDetonated:
		#explode($RayCast2D.testOfHowmanyBombs+3)
		isDetonated=true
		$Sprite2D.visible=false
		_explod3()
		await get_tree().create_timer(1).timeout 
		queue_free()
		#print($RayCast2D.testOfHowmanyBombs)
	#elif value2 > detonateTime+2 :
		#queue_free()
		
			
	#BOMB EFFECT SPEED INCREASE WITH TWEEN
	#var tween = get_tree().create_tween();
	#tween.tween_method(
	#func(value): $Sprite2D.material.set_shader_parameter("detonatetimer", value),  
	 #1.0,  # Start value
	  #10.0,  # End value
	  #5     # Duration
	#)
	
	
#func explode(explosionSize):
	##const BOMB_EXPLODE = preload("res://bombexplody.tscn")
	##var newExplosion = BOMB_EXPLODE.instantiate()	
	##newExplosion.global_position = self.global_position	
	##self.add_child(newExplosion)
	#var listofVectors=[Vector2(64,0),Vector2(-64,0),Vector2(0,-64),Vector2(0,64)]
	#for i in range(4):
		#for j in range(explosionSize):
			#const BOMB_EXPLODE2 =preload("res://bombexplody.tscn")
			#var newExplosion2 = BOMB_EXPLODE2.instantiate()	
			#newExplosion2.global_position = self.global_position + (listofVectors[i]*j)			
			#self.add_child(newExplosion2)
			
	
func take_damage():	
	if !isDetonated:
		_explod3()
		isDetonated=true
		print("exploded")
		await get_tree().create_timer(1).timeout 
		queue_free()
	else:pass


#func explod3():
	##const BOMB_EXPLODE = preload("res://bombexplody.tscn")
	##var newExplosion = BOMB_EXPLODE.instantiate()	
	##newExplosion.global_position = self.global_position	
	##self.add_child(newExplosion)
	#var listofVectors=[Vector2(64,0),Vector2(0,64),Vector2(-64,0),Vector2(0,-64)]	
	#for j in range($RayCast2D1.testOfHowmanyBombs+3):
		#const BOMB_EXPLODE2 =preload("res://bombexplody.tscn")
		#var newExplosion2 = BOMB_EXPLODE2.instantiate()	
		#newExplosion2.global_position = self.global_position + (listofVectors[0]*j)			
		#self.add_child(newExplosion2)
	#for j in range($RayCast2D2.testOfHowmanyBombs+3):
		#const BOMB_EXPLODE2 =preload("res://bombexplody.tscn")
		#var newExplosion2 = BOMB_EXPLODE2.instantiate()	
		#newExplosion2.global_position = self.global_position + (listofVectors[1]*j)			
		#self.add_child(newExplosion2)
	#for j in range($RayCast2D3.testOfHowmanyBombs+3):
		#const BOMB_EXPLODE2 =preload("res://bombexplody.tscn")
		#var newExplosion2 = BOMB_EXPLODE2.instantiate()	
		#newExplosion2.global_position = self.global_position + (listofVectors[2]*j)			
		#self.add_child(newExplosion2)
	#for j in range($RayCast2D4.testOfHowmanyBombs+3):
		#const BOMB_EXPLODE2 =preload("res://bombexplody.tscn")
		#var newExplosion2 = BOMB_EXPLODE2.instantiate()	
		#newExplosion2.global_position = self.global_position + (listofVectors[3]*j)			
		#self.add_child(newExplosion2)

func _explod3():
	var listofVectors=[Vector2(64,0),Vector2(0,64),Vector2(-64,0),Vector2(0,-64)]	
	for i in range(1,5): 
		var raycastid ="RayCast2D" + str(i)		
		for j in range(get_node(raycastid).testOfHowmanyBombs+2):
			#print(get_node(raycastid).testOfHowmanyBombs)
			const BOMB_EXPLODE2 =preload("res://bombexplody.tscn")
			var newExplosion2 = BOMB_EXPLODE2.instantiate()	
			newExplosion2.global_position = self.global_position + (listofVectors[i-1]*j)			
			self.add_child(newExplosion2)
		

