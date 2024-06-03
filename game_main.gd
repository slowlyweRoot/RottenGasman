extends Node2D

const CRATESPAWNPOINT:Vector2 = Vector2(-1904,-1840)
const CRATESPAWNPOINT2:Vector2 = Vector2(-1904,-1777)

func _ready():
	spawn_crates()

func _physics_process(delta):
	if Input.is_action_just_pressed("restart"):
		get_tree().reload_current_scene() 
	
func spawn_crates():
	
	for i in range (30):
		for j in range(71):		
			if randf() > 0.6:	
				const CRATE = preload("res://Crate.tscn")
				var newCrate = CRATE.instantiate()
				newCrate.global_position = CRATESPAWNPOINT + Vector2((j*64),(i*127.5))
				self.add_child(newCrate)
	
	for i in range (29):
		for j in range(36):		
				if randf() > 0.6:	
					const CRATE = preload("res://Crate.tscn")
					var newCrate = CRATE.instantiate()
					newCrate.global_position = CRATESPAWNPOINT2 + Vector2((j*128),(i*127.5))
					self.add_child(newCrate)
			
