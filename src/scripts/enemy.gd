extends RigidBody2D

onready var timer = get_node("Timer")

func back_off(moveDir):
	print("About to backoff : ", moveDir)
	timer.stop()
	var offset = Vector2(0, 0)
	if timer.get_time_left() == 0:
		apply_impulse(offset, moveDir)
		timer.start()

func _on_Timer_timeout():
	set_linear_velocity(Vector2(0, 0))
