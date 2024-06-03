extends StaticBody2D

func take_damage():
	queue_free()
	drop_loot()
	
	
func drop_loot():
	if randf() < 0.6:
		pass
		
