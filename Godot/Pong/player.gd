extends Paddle

export var action_up:String = "p1_up"
export var action_down:String = "p1_down"

export var speed:float = 3.0 * 60.0


func move(delta:float)->void:
	var dir:float
	dir = Input.get_action_strength(action_down) - Input.get_action_strength(action_up)
	position += Vector2.DOWN * dir * speed * delta
	
