extends CharacterBody3D
@onready var camera_mount: Node3D = $camera_mount
@onready var visuals: Node3D = $visuals


var SPEED = 3.0
const JUMP_VELOCITY = 4.5
var walking_speed = 3.0
var running_speed = 5.0
@export var sens_horizontal = 0.0005
@export var sens_vertical = 0.0005

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _input(event):
	if Input.is_action_pressed("esc"):
		get_tree().quit()
	if event is InputEventMouseMotion:
		rotate_y(rad_to_deg(-event.relative.x*sens_horizontal))
		visuals.rotate_y(rad_to_deg(event.relative.x*sens_horizontal))
		camera_mount.rotate_x(rad_to_deg(-event.relative.y*sens_vertical))


func _physics_process(delta: float) -> void:
	
	if Input.is_action_pressed("run") or Input.is_action_just_pressed("ui_accept"):
		SPEED = running_speed 
	else:
		SPEED = walking_speed
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("left", "right", "forward", "backward")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
		
		visuals.look_at(position + direction)
		
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
