extends Node2D

# Mobile integration for Platform Jumper
# User clicks left and right buttons to move


# Left
func _on_leftbutton_pressed():
	Input.action_press("move_left")


func _on_leftbutton_released():
	Input.action_release("move_left")


# Right
func _on_rightbutton_pressed():
	Input.action_press("move_right")


func _on_rightbutton_released():
	Input.action_release("move_right")
