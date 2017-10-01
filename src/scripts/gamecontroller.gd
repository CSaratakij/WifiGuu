extends Node2D

onready var timer = get_owner().get_node("RandomRouterTimer")

var actorParent = null

var routers = []
var currentRouterPos = Vector2(0, 0)

var enemys = []


func _ready():
	initialize()
	set_process(true)

func _process(delta):
	if timer.get_time_left() == 0:
		timer.start()

func _on_RandomRouterTimer_timeout():
	random_select_router()

func random_select_router():
	print("Random new router...")


func initialize():
	var children = get_owner().get_children()

	for node in children:
		if node.get_groups().has("router"):
			routers.append(node)

	actorParent = get_owner().get_node("YSort")

	for node in actorParent.get_children():
		if node.get_groups().has("enemy"):
			enemys.append(node)

	for enemy in enemys:
		enemy.set_pos_target(currentRouterPos)
