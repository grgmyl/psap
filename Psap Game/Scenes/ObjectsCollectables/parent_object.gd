extends Area2D

func _ready():
	pass

func _process(_delta):
	pass
	
func _on_body_entered(body):
	if body.has_method("collect"):
		body.collect()
		queue_free()
		
func _on_glow_timer_timeout():
	var glowTween = create_tween()
	glowTween.tween_property($PointLight2D,"energy",3.5,0.5)
	glowTween.tween_property($PointLight2D,"energy",5,0.5)
