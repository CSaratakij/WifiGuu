extends RigidBody2D

const MOVE_FORCE = 500

onready var sprite = get_node("Sprite")
onready var download_progress = get_node("DownloadProgress")

var isFlip = false

var moveDir = Vector2()
var velocity = Vector2()


func _ready():
	set_process(true)
	set_process_input(true)
	set_fixed_process(true)

func _input(event):
	if Input.is_action_pressed("move_left"):
		if not isFlip:
			_flip_sprite()
		moveDir.x = -1
	elif Input.is_action_pressed("move_right"):
		if isFlip:
			_flip_sprite()
		moveDir.x = 1
	else:
		moveDir.x = 0

	if Input.is_action_pressed("move_up"):
		moveDir.y = -1
	elif Input.is_action_pressed("move_down"):
		moveDir.y = 1
	else:
		moveDir.y = 0

func _process(delta):
	pass

func _fixed_process(delta):
	if moveDir.length() > 1:
		moveDir = moveDir.normalized()
	velocity = moveDir * MOVE_FORCE
	set_linear_velocity(velocity)

func _on_Area2D_area_enter(area):
	var groups = area.get_groups()
	if groups.has("router"):
		print("Found router..")

func _flip_sprite():
	isFlip = !isFlip
	sprite.set_flip_h(isFlip)
