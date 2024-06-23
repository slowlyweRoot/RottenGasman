extends StaticBody2D
@onready var gameMain = get_parent()
var islootDropped=false

func take_damage():
	drop_loot()
	islootDropped=true
	queue_free()
	

func drop_loot():
	if randf() < 1 && islootDropped==false:
		const UPGRADES = preload("res://upgrades/upassets/upgrades.tscn")
		var newUpgrade = UPGRADES.instantiate()
		newUpgrade.global_position = $".".global_position
		$"../".call_deferred("add_child",newUpgrade)
		
#
#func _on_area_2d_area_entered(area):
	#if area.is_in_group("explosion"):
		#take_damagez()
