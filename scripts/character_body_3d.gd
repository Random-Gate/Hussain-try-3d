extends CharacterBody3D

const BASE_SPEED = 5.0
var SPEED = 5.0
const SPRINT = 8.0
const DECELERATION = 0.01
const JUMP_VELOCITY = 10
var points = 0



func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("Leave"):
		get_tree().quit()
	
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	if not is_on_floor() and position.y < -10:
		get_tree().reload_current_scene()

	# Handle jump.
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("Left", "Right", "ui_up", "ui_down")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		
	else:
		velocity.x = move_toward(velocity.x, 0, BASE_SPEED)
	
	#Sprint handling
	if Input.is_action_pressed("Sprint") and is_on_floor() and direction.x +- 0:
		SPEED = SPRINT
	elif not is_on_floor():
		if SPEED > BASE_SPEED:
			SPEED = SPEED - DECELERATION
	
	
	
	
	
	move_and_slide()

func addPoints():
	points = points + 1
