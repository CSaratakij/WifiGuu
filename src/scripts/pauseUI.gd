extends Control

onready var mainmenu = preload("res://scenes/mainmenu.tscn")
onready var level = preload("res://scenes/level.tscn")
onready var tree = get_tree()

func _on_btnRestart_pressed():
	tree.set_pause(false)
	tree.change_scene_to(level)

func _on_btnQuit_pressed():
	tree.quit()
