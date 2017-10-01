extends RigidBody2D

const MOVE_FORCE = 100

onready var timer = get_node("Timer")

var isHit = false
var isCloseTarget = false
var pos_target = Vector2(0, 0)
var relativePos = Vector2(0, 0)

func _ready():
	set_process(true)
	set_fixed_process(true)

func _process(delta):
	relativePos = pos_target - get_global_pos()
	isCloseTarget = relativePos.length() <= 1

func _fixed_process(delta):
	if not isHit:
		if not isCloseTarget:
			move_to_target()

func set_pos_target(target):
	pass

func back_off(moveDir):
	print("About to backoff : ", moveDir)
	isHit = true
	timer.stop()
	var offset = Vector2(0, 0)
	if timer.get_time_left() == 0:
		apply_impulse(offset, moveDir)
		timer.start()

func _on_Timer_timeout():
	set_linear_velocity(Vector2(0, 0))
	isHit = false

func move_to_target():
	# print("Moving to target..")
	var dir = relativePos.normalized()
	var velocity = MOVE_FORCE * dir
	set_linear_velocity(velocity)
