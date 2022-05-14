extends KinematicBody2D
export var speed : int = 100
export var moveDist : int = 100
onready var startX : int = global_position.x
onready var targetX : int = global_position.x + moveDist
onready var platform: = $Sprite

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	platform.global_position.x = 2
	platform.global_position.y = 2

func _physics_process(delta):
	if platform.global_position.x == targetX:
		if targetX == startX:
			targetX = platform.global_position.x + moveDist
		else:
			targetX = startX
func move_to (current, to,step):
	var new = current

	# are we moving positive?
	if new < to:
		new += step 
		if new > to:
			new = to
		#are we moving negative?
		else:
			new -= step 
			if new < to:
				new = to            
		return new
