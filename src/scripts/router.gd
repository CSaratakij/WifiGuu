extends Area2D

const MIN_BITRATE  = 0.01
const MAX_BITRATE = 2

var totalConnection = 0
var currentBitrate = 0

func _ready():
	set_process(true)

func _process(delta):
	pass
