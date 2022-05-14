extends Node2D



func _on_leftbutton_pressed():
	Input.action_press("move_left")


func _on_leftbutton_released():
	Input.action_release("move_left")


func _on_rightbutton_pressed():
	Input.action_press("move_right")


func _on_rightbutton_released():
	Input.action_release("move_right")
