extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
onready var file = 'res://train_easy/algebra__linear_2d.txt'
var array1: Array = []
var array2: Array = []

func show_trivia():
	var f = File.new()
	f.open(file, File.READ)
	var index = 1
	while not f.eof_reached(): # iterate through all lines until the end of file is reached
		var line = f.get_line()
		if fmod(index, 2) == 1:
			array1+=line
		if fmod(index, 2) == 0:
			array2+=line
		index+=1
	f.close()
