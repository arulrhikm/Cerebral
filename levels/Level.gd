extends Node2D

onready var width: = get_viewport_rect().size.x
onready var height: = get_viewport_rect().size.y 

var platform: = preload("res://objects/Platform.tscn")
var platform2: = preload("res://objects/SinglePlatform.tscn")

var platformCount: = 1
var platform2Count:=5
onready var player: = $Player
onready var platformParent: = $Platforms
onready var platformParent2: = $Platforms2
var platforms: = []
var platforms2: = []
onready var treshold: = height * 0.5
var scrollSpeed = 0.05
onready var background:Sprite = $"ParallaxBackground/ParallaxLayer/Sprite"

func _ready()->void:
	OS.center_window()
	player.global_position.y = treshold
	for i in platformCount:
		var inst: = platform.instance()
		inst.global_position.y = height / platformCount * i
		inst.global_position.x = 0
		platformParent.add_child(inst)
		platforms.append(inst)
	for i in platform2Count:
		var inst2: = platform2.instance()
		inst2.global_position.y = height / platform2Count * (i)
		if i == 0:
			inst2.global_position.x = 50000000000000000
		else:
			inst2.global_position.x = rand_x()
		platformParent2.add_child(inst2)
		platforms2.append(inst2)
	#safety net - put lowest platform under player
	player.global_position.x = rand_x()
	platforms2.back().global_position.x = player.global_position.x
func rand_x()->float:
	return rand_range(28.0, width-28.0)

func _physics_process(delta:float)->void:
	if player.global_position.y < treshold:
		var move:float = lerp(0.0, treshold -player.global_position.y, scrollSpeed)
		move_background(move)
		player.global_position.y += move
		for plat in platforms:
			plat.global_position.y += move
			if plat.global_position.y > height:
				plat.global_position.y -= height
		for plat2 in platforms2:
			plat2.global_position.y += move
			if plat2.global_position.y > height:
				plat2.global_position.y -= (height)
				plat2.global_position.x = rand_x()
	if player.global_position.x< 0:
		player.global_position.x = 455
	if player.global_position.x> 455:
		player.global_position.x = 0
	if player.global_position.y > height:
		game_over()

func move_background(move:float)->void:
	var ratio: = .75
	background.global_position.y = fmod((background.global_position.y +height +move*ratio), height) - height

func game_over()->void:
	get_tree().reload_current_scene()



