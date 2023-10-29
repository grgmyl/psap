extends CharacterBody2D
class_name CharacterParent

var SPEED = 300.0
var JUMP_VELOCITY = -500.0
var direction
var health = 100
var movementEnable = true    #Eπιτρέπει την κίνηση όταν είναι true
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func hit(dmg,knockback, dmg_Vector2):   #Ειναι το function για να δέχονται dmg και knockback οι χαρακτήρες
	movementEnable = false
	health= health-dmg
	if health<=0:
		queue_free()
	else:
		velocity = Vector2(knockback,knockback)*(position-dmg_Vector2)
		$KnockbackTimer.start()

func _on_knockback_timer_timeout():
	movementEnable=true
