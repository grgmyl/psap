extends Area2D
var dmg = 5
var speed = 850
var direction = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += direction*speed*delta

func _on_body_entered(body):
	if body.has_method("hit"):
		body.hit(dmg,1,get_global_position())
	queue_free()
	
func _on_free_timer_timeout():
	queue_free()
