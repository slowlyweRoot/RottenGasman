extends Node2D
var count = 0

const CRATESPAWNPOINT:Vector2 = Vector2(-1904,-1840)
const CRATESPAWNPOINT2:Vector2 = Vector2(-1904,-1777)

func _ready():
	Engine.max_fps = 64	
	spawn_crates()	
	spawn_circle()

func _physics_process(delta):
	if Input.is_action_just_pressed("restart"):
		get_tree().reload_current_scene() 
	%fpscounter.text = str(Engine.get_frames_per_second())
func spawn_crates():
	
	for i in range (30):
		for j in range(71):		
			if randf() > 0.6:	
				const CRATE = preload("res://Crate.tscn")
				var newCrate = CRATE.instantiate()
				newCrate.global_position = CRATESPAWNPOINT + Vector2((j*64),(i*128))
				self.add_child(newCrate)
	
	for i in range (29):
		for j in range(36):		
				if randf() > 0.6:	
					const CRATE = preload("res://Crate.tscn")
					var newCrate = CRATE.instantiate()
					newCrate.global_position = CRATESPAWNPOINT2 + Vector2((j*128),(i*128))
					self.add_child(newCrate)
			
	
func spawn_circle():
	const CIRCLE = preload("res://circle.tscn")
	var newCircle = CIRCLE.instantiate()
	newCircle.global_position = Vector2((randi_range(-1000,1000)),(randi_range(-1000,1000)))
	self.add_child(newCircle)
