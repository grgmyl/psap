extends CharacterParent

func _ready():
	SPEED = 300.0
	JUMP_VELOCITY = -500.0
	health = 100


func collect(itemType, value): 
	if itemType=="healthPotion":
		health += value
		if health>100:
			health=100
		$HPbar/DisappearTimer.start()
		$HPbar.modulate = Color(1,1,1,1)
	if itemType == "Boost":
		SPEED*= 2
		$BoostTimer.start()

func _on_boost_timer_timeout():
	SPEED /= 2

func _physics_process(delta):
	
	if not is_on_floor():            # Add the gravity.
		velocity.y += gravity * delta
	
	if movementEnable==true:
		if Input.is_action_just_pressed("ui_accept") and is_on_floor(): # Handle Jump.
			velocity.y = JUMP_VELOCITY
		
		# Get the input direction and handle the movement/deceleration.
		direction = Input.get_axis("ui_left", "ui_right")
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
