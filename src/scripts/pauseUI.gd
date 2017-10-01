extends Control

onready var mainmenu = preload("res://scenes/mainmenu.tscn")
onready var tree = get_tree()

func _on_btnRestart_pressed():
	tree.set_pause(false)
	tree.reload_current_scene()

func _on_btnQuit_pressed():
	tree.quit()
