extends Node2D
var upgradeList = ["bombamount","bombtime","explosionsize","hpincrease","rewind","speed"]
var upis=null
const BOMBAMOUNT = preload("res://upgrades/upassets/bombamount.png")
const BOMBTIME = preload("res://upgrades/upassets/bombtime.png")
const EXPLOSIONSIZE = preload("res://upgrades/upassets/explosionsize.png")
const HPINCREASE = preload("res://upgrades/upassets/hpincrease.png")
const REWIND = preload("res://upgrades/upassets/rewind.png")
const SPEED = preload("res://upgrades/upassets/speed.png")
func _ready():
	upis = upgradeList.pick_random()	
	
	if   upis ==  "bombamount" :
			%Sprite2D.texture = BOMBAMOUNT			
	elif upis ==  "bombtime":
		%Sprite2D.texture = BOMBTIME
		
	elif upis ==  "explosionsize":
		%Sprite2D.texture = EXPLOSIONSIZE
		
	elif upis ==  "hpincrease":
		%Sprite2D.texture = HPINCREASE
		
	elif upis ==  "rewind":
		%Sprite2D.texture = REWIND
		
	elif upis ==  "speed":
		%Sprite2D.texture = SPEED

func _on_area_2d_area_entered(area):
	#if area.is_in_group("player"):
		print(upis)
		if   upis ==  "bombamount" :
			Global.bombAmount+=1
			
		elif upis ==  "bombtime":
			Global.bombExplosionTime-=2
			
		elif upis ==  "explosionsize":
			Global.explosionSizeUnit+=1
			
		elif upis ==  "hpincrease":
			Global.playerHealth+=25
			#change to heal function if needed
			
		elif upis ==  "rewind":
			Global.rewindAmount+=1
			
		elif upis ==  "speed":
			Global.playerSpeed+=25			
		queue_free()

