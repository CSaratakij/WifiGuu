extends Area2D

const MIN_BITRATE  = 0.01
const MAX_BITRATE = 2

var totalConnection = 0
var currentBitRate = 0

func _ready():
	set_process(true)

func _process(delta):
	if totalConnection > 0:
		var bitrate = MAX_BITRATE / totalConnection
		if bitrate <= 0:
			currentBitRate = MIN_BITRATE
		else:
			currentBitRate = bitrate
	else:
		currentBitRate = MAX_BITRATE

	# print("Total connection: ", totalConnection)
	# print("Total bitrate : ", currentBitRate)
