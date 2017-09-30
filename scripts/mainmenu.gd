extends Panel

onready var _tree = get_tree()
onready var nextScene = preload("res://scenes/level.tscn")

func _on_btnPlay_pressed():
	_tree.change_scene_to(nextScene)

func _on_btnQuit_pressed():
	_tree.quit()
