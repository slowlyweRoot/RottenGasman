extends CharacterBody2D
@export var speed = 180
var timer = 0
var rewindList = []
var isRewinding = false

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed

func _physics_process(delta):
	get_input()
	move_and_slide()	
	if velocity.y > 0:
		$Sprite2D/AnimationPlayer.play("walk_down")
	elif velocity.y < 0:
		$Sprite2D/AnimationPlayer.play("walk_up")
	elif velocity.x > 0 :
		$Sprite2D/AnimationPlayer.play("walk_right")
	elif velocity.x < 0 :
		$Sprite2D/AnimationPlayer.play("walk_left")
	else:
		$Sprite2D/AnimationPlayer.play("idle_front")
	
	timer += delta
	if timer>0.1 &&isRewinding ==false:
		timer=0	
		#print(position)
		rewindList.append(position)
	if Input.is_action_just_pressed("rewind"):
		rewind()
	if Input.is_action_just_pressed("bomb"):
		bomb()

func rewind():
	isRewinding=true
	#var poppedPos:Vector2	
	var rewindDistance
	#for pos in rewindList:
		#await get_tree().create_timer(0.1).timeout		
		#poppedPos=rewindList.pop_back()
		#position = poppedPos
		#print("rewinded pos " + str(poppedPos))
	if len(rewindList) < 10:	
		rewindDistance=len(rewindList)	
	else:
		rewindDistance=10
				
	for i in range(rewindDistance):
		await get_tree().create_timer(0.05).timeout
		position = rewindList[-(i+1)]		
	isRewinding=false	
	rewindList=[]

func bomb():
	const BOMB =preload("res://bomb.tscn")
	var newBomb = BOMB.instantiate()	
	newBomb.global_position = $".".global_position
	$".".add_child(newBomb)
	print("added bomb")
