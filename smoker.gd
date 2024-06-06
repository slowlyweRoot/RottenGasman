extends StaticBody2D

func _ready():
	var time = randf_range(.0, 6)
	await get_tree().create_timer(time).timeout
	%Sprite2D/AnimationPlayer.play("pls_Sendhelp")
	


func _on_area_2d_area_exited(area):
	%Sprite2D.visible = true
	
	var tween = create_tween()
	tween.tween_property(%Sprite2D,"modulate:a",0.9,2)
