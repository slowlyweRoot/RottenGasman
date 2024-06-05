extends Node2D
var count = 0
signal toMove 

const CRATESPAWNPOINT:Vector2 = Vector2(-1904,-1840)
const CRATESPAWNPOINT2:Vector2 = Vector2(-1904,-1777)

func _ready():
	Engine.max_fps = 60	
	spawn_crates()
	#spawn_clouds()

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
			
func spawn_clouds():
	while %PathFollow2D.progress_ratio <= 0.99:
	#for i in range(10):
		count += 1
		var new_clouds= preload("res://smokerz.tscn").instantiate()
		#self.connect("toMove",(new_clouds.test_to_zero()))
		%PathFollow2D.progress_ratio += 0.01
		#print(%PathFollow2D.progress_ratio)
		new_clouds.global_position = %PathFollow2D.global_position
		add_child(new_clouds)
		#print("spawned" + str (count))


func _on_timer_timeout():
	toMove.emit()
	# print("emited")
	
