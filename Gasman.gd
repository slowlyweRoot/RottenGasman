extends CharacterBody2D
#@export var speed:int= 600
#@export var playerHealth:int=100 
var bombDamage=30
var timer = 0
var rewindList = []
var isRewinding = false
var circleDamage = 5
var isOutsideCircle=false
var circleTimer=0

func _ready():
	pass
func get_input():	
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * Global.playerSpeed
	
func _physics_process(delta):
	if !isRewinding:
		get_input()
		move_and_slide()
	if isOutsideCircle==true:
		circleTimer+=1
		if circleTimer%30==0:			
			take_circle_damage()
	elif isOutsideCircle==false:
		circleTimer=0	
		
	if velocity.y > 0:
		%AnimationPlayer.play("walk_down")
	elif velocity.y < 0:
		%AnimationPlayer.play("walk_up")
	elif velocity.x > 0 :
		%AnimationPlayer.play("walk_right")
	elif velocity.x < 0 :
		%AnimationPlayer.play("walk_left")
	else:
		%AnimationPlayer.play("RESET")
	
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
	if Global.rewindAmount >0 :
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
	if Global.activeBombAmount < Global.bombAmount:
		const BOMB =preload("res://bomb.tscn")
		var newBomb = BOMB.instantiate()	
		newBomb.global_position = $".".global_position
		$".".add_child(newBomb)
		Global.activeBombAmount+=1
	else:
		pass

func take_damage():	
	print("bomb damage")
	Global.playerHealth = Global.playerHealth - bombDamage
	if Global.playerHealth <=0:
		queue_free()
	#animate take damage fzzz

func take_circle_damage():
	Global.playerHealth = Global.playerHealth - circleDamage
	print("taking damage" + str(Global.playerHealth))
	if Global.playerHealth <=0:
		queue_free()
	

