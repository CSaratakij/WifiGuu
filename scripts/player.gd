extends RigidBody2D

onready var sprite = get_node("Sprite")

var isFlip = false
var moveDir = Vector2()
var velocity = Vector2()


func _ready():
	set_process_input(true)
	set_process(true)
	set_fixed_process(true)

func _input(event):
	if event.is_action_pressed("move_left"):
		if not isFlip:
			_flip_sprite()
		moveDir.x = -1

	elif event.is_action_pressed("move_right"):
		if isFlip:
			_flip_sprite()
		moveDir.x = 1

	else:
		moveDir.x = 0

	if Input.is_action_pressed("move_up"):
		moveDir.y = 1
	elif Input.is_action_pressed("move_down"):
		moveDir.y = -1
	else:
		moveDir.y = 0

func _process(delta):
	pass

func _fixed_process(delta):
	pass

func _flip_sprite():
	isFlip = !isFlip
	sprite.set_flip_h(isFlip)
