extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var direction
var health = 100
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func collect(itemType, value):
	if itemType=="healthPotion":
		health += value
		if health>100:
			health=100

func _physics_process(delta):
	
	if not is_on_floor():            # Add the gravity.
		velocity.y += gravity * delta
	
	if Input.is_action_just_pressed("ui_accept") and is_on_floor(): # Handle Jump.
		velocity.y = JUMP_VELOCITY
	
	# Get the input direction and handle the movement/deceleration.
	direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
