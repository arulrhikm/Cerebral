extends Node2D
export var speed : int = 50
onready var width: = get_viewport_rect().size.x
onready var height: = get_viewport_rect().size.y

var platform: = preload("res://objects/Platform.tscn")

var platformCount: = 5
onready var player: = $Player
onready var impact: = $CollisionShape2D
onready var platformParent: = $Platforms
onready var impact2: = $CollisionShape2D2
var platforms: = []
var impacts2: = []
onready var treshold: = height * 0.5
var scrollSpeed = 0.05
onready var background:Sprite = $"ParallaxBackground/ParallaxLayer/Sprite"

func _ready()->void:
	OS.center_window()
	player.global_position.y = treshold
	for i in platformCount:
		var inst: = platform.instance()
		var insts = impact2.instance()
		inst.global_position.y = height / platformCount * i
		inst.global_position.x = = inst.global_position.x = rand_x()
		insts.global_position.y = height / platformCount * i
		insts.global_position.x = rand_x()
		platformParent.add_child(inst)
		platforms.append(inst)
		impact2.add_child(inst)
		impacts2.append(inst)
	#safety net - put lowest platform under player
	player.global_position.x = rand_x()
	player.global_position.x = rand_x()
	platforms.back().global_position.x = player.global_position.x

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
				plat.global_position.x = rand_x()
			plat.global_position.x = move_to(position.x, 500, speed * delta)
			if plat.global_position.x == 500:
				plat.global_position.x = move_to(position.x, 0, speed * delta)
	if player.global_position.y > height:
		game_over()

func move_background(move:float)->void:
	var ratio: = 0.75
	background.global_position.y = fmod((background.global_position.y +height +move*ratio), height) - height

func game_over()->void:
	get_tree().reload_current_scene()


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

