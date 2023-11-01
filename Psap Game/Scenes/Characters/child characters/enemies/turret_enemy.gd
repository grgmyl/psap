extends StaticBody2D

var health = 100
var projectile_scene = preload("res://Scenes/Characters/child characters/enemies/projectile_enemy.tscn")
var can_shoot = false
var target

func hit(dmg,_knockback, _dmg_Vector2):   #Ειναι το function για να δέχονται dmg και knockback οι χαρακτήρες
	health= health-dmg
	$HPbar.value = health
	if health<=0:
		queue_free()
	else:
		$HPbar/DisappearTimer.start()
		$HPbar.modulate = Color(1,1,1,1)


func _on_area_2d_body_entered(body):
	can_shoot = true
	target = body


func _on_area_2d_body_exited(_body):
	can_shoot = false

func shoot():
	var projectile = projectile_scene.instantiate()
	add_child(projectile)
	projectile.position = Vector2.ZERO
	projectile.direction = (target.position-position).normalized()

func _on_reload_timeout():
	if can_shoot:
		shoot()
