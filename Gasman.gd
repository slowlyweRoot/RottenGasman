extends CharacterBody2D
@export var speed = 180

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
