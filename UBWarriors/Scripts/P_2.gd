extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var oponent
var orient

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		
	# Handle Jump.
	if Key.JP("up_2"):
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("left_2", "right_2")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	move_and_slide()
	sprite_handling()
	
func sprite_handling():
	#Mudar a direção
	if position.x < oponent.position.x:
		orient = "left"
		get_node("Sprites").scale.x = 1
	else:
		orient = "right"
		get_node("Sprites").scale.x = -1
	
	if is_on_floor():
		if velocity.x == 0 and velocity.y == 0:
			$Sprites.play("Idle")
		elif velocity.x > 0:
			if orient == "left":
				$Sprites.play("Walk")
			else:
				$Sprites.play_backwards("Walk")
		elif velocity.x < 0:
			if orient == "left":
				$Sprites.play_backwards("Walk")
			else:
				$Sprites.play("Walk")
		
