extends Node2D

signal Start
# signals start of Platform Jumper game


func _on_Start_pressed():
	emit_signal("Start")
	# sends out start signal when the game's start button is pressed
