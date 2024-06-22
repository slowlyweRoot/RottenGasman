extends Node2D
var value : float = 1.0
var value2 : float = 1.0
var isDetonated :bool=false
var isAlreadyDamagedToPlayer :bool = false
@onready var ray_cast_2d_1 = $RayCast2D1
@onready var ray_cast_2d_2 = $RayCast2D2
@onready var ray_cast_2d_3 = $RayCast2D3
@onready var ray_cast_2d_4 = $RayCast2D4

@onready var listOfRayCasts = [ray_cast_2d_1,ray_cast_2d_2,ray_cast_2d_3,ray_cast_2d_4]



func _on_timer_timeout():
	$".".set_collision_layer_value(1,true)
	#BOMB EFFECT SPEED INCREASE MY WAY
	# print(str($Sprite2D.material.get_shader_parameter("detonatetimer"))+"&&" + self.name)
	%Sprite2D.material.set_shader_parameter("detonatetimer", value2)
	value2+=2
	if value2 > Global.bombExplosionTime && !isDetonated:
		isDetonated=true
		%Sprite2D.visible=false
		_explod3()
		await get_tree().create_timer(0.5).timeout 
		queue_free()
		
	
func take_damage():
	if !isDetonated:
		_explod3()
		%Sprite2D.visible=false
		isDetonated=true
		print("exploded")
		await get_tree().create_timer(0.5).timeout 
		queue_free()
	else:pass

func _explod3():
	const BOMB_EXPLODE =preload("res://bombexplody.tscn")
	var newExplosion = BOMB_EXPLODE.instantiate()
	newExplosion.global_position = self.global_position
	self.call_deferred("add_child", newExplosion)
	var listofVectors=[Vector2(64,0),Vector2(0,64),Vector2(-64,0),Vector2(0,-64)]	
	for i in range(4):
		#print(listOfRayCasts[i])
		for j in range(1,listOfRayCasts[i].testOfHowmanyBombs+2):
			const BOMB_EXPLODE2 =preload("res://bombexplody.tscn")
			var newExplosion2 = BOMB_EXPLODE2.instantiate()
			newExplosion2.global_position = self.global_position + (listofVectors[i]*j)
			self.call_deferred("add_child", newExplosion2)
	
	Global.activeBombAmount-=1
