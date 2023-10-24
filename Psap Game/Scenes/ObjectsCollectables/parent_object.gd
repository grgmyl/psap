extends Area2D
class_name parent_object
var itemType
var value

func _ready():
	pass

func _process(_delta):
	pass
	
func _on_body_entered(body):
	if body.has_method("collect"):
		body.collect(itemType,value) #Το 1ο parameter θα είναι string που θα δηλώνει τι είδους item ειναι, και το 2ο θα είναι μια τιμή
		queue_free()
		
func _on_glow_timer_timeout():
	var glowTween = create_tween()
	glowTween.tween_property($PointLight2D,"energy",3.5,0.5)
	glowTween.tween_property($PointLight2D,"energy",5,0.5)
