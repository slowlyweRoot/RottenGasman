extends StaticBody2D

func take_damage():
	queue_free()
	drop_loot()
	
	
func drop_loot():
	if randf() < 0.6:
		pass
		

#
#func _on_area_2d_area_entered(area):
	#if area.is_in_group("explosion"):
		#take_damagez()
