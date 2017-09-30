extends Node2D

onready var player = get_node("player")
onready var progressUI = get_node("progressUI").get_node("Panel").get_node("ProgressBar")


func _ready():
	set_process(true)

func _process(delta):
	progressUI.set_value(player.download_progress.current)
