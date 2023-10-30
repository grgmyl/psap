extends ProgressBar


# Called when the node enters the scene tree for the first time.
func _ready():
	modulate = Color(1,1,1,0)
	max_value = $"..".health
	value = $"..".health


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_disappear_timer_timeout():
	var disappeartween = create_tween()
	disappeartween.tween_property($".","modulate",Color(1,1,1,0),0.45)
