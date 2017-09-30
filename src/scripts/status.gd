extends Node2D

export(int) var minimum = 0
export(int) var maximum = 100

onready var current = minimum


func full_restore():
	current = maximum

func clear():
	current = minimum

func restore(value):
	var newValue = current + value
	if newValue > maximum:
		current = maximum
	else:
		current = newValue

func remove(value):
	var newValue = current - value
	if newValue <= minimum:
		current = minimum
	else:
		current = newValue

func is_empty():
	return current <= minimum

