extends Node2D

onready var tree = get_owner().get_tree()
onready var pauseUI = get_owner().get_node("pauseUI")
onready var timer = get_owner().get_node("RandomRouterTimer")
onready var navigation2D = get_owner().get_node("Navigation2D")

var actorParent = null

var routers = []
var currentRouterPos = Vector2(0, 0)

var player = null
var enemys = []

var currentRouterIndex = 0

func _ready():
	initialize()
	set_process(true)

func _process(delta):
	player.set_current_bitrate(routers[currentRouterIndex].currentBitRate)

	if timer.get_time_left() == 0:
		timer.start()

	if player.download_progress.current >= player.download_progress.maximum:
		pauseUI.show()
		tree.set_pause(true)

	update_enemy_target()

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

func update_enemy_target():
	for enemy in enemys:
		if enemy.isNeedNewPath:
			var path = navigation2D.get_simple_path(enemy.get_global_pos(), enemy.pos_target)
			enemy.set_move_path(path)
			enemy.isNeedNewPath = false
