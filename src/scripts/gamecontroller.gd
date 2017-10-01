extends Node2D

onready var pauseUI = get_owner().get_node("pauseUI")
onready var timer = get_owner().get_node("RandomRouterTimer")

var actorParent = null

var routers = []
var currentRouterPos = Vector2(0, 0)

var player = null
var enemys = []

func _ready():
	initialize()
	set_process(true)

func _process(delta):
	if timer.get_time_left() == 0:
		timer.start()

	if player.download_progress.current >= player.download_progress.maximum:
		print("next level")
		pauseUI.show()

func _on_RandomRouterTimer_timeout():
	random_select_router()

func random_select_router():
	print("Random new router...")

func initialize():
	var children = get_owner().get_children()

	for node in children:
		if node.get_groups().has("router"):
			routers.append(node)

	currentRouterPos = routers[0].get_global_pos()
	actorParent = get_owner().get_node("YSort")

	for node in actorParent.get_children():
		if node.get_groups().has("player"):
			player = node

		if node.get_groups().has("enemy"):
			enemys.append(node)

	for enemy in enemys:
		enemy.set_pos_target(currentRouterPos)

	pauseUI.hide()
