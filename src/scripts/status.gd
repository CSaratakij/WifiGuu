extends Node2D

export(int) var minimum = 0
export(int) var maximum = 100

onready var current = minimum


func full_restore():
	current = maximum

func clear():
	current = minimum

func restore(value):
	current += value

func remove(value):
	current -= value

func is_empty():
	return current <= minimum

