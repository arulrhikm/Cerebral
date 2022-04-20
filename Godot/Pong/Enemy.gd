extends Paddle

export var speed:float = 3.0 * 60.0

export var update_interval: float = (1.0 /60) *30 #multiply by frame count

onready var target:Node2D = get_node("../Ball")
var target_height: = 0.0

var timer: = Timer.new()

func _ready()->void:
	add_child(timer)
	timer.start(update_interval)
	timer.connect("timeout", self, "timeout")

func timeout()->void:
	target_height = target.global_position.y

func move(delta)->void:
	var dist: = target_height - global_position.y
	if abs(dist) > speed * delta:
		position += Vector2.DOWN * sign(dist) * speed * delta
