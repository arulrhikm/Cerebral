extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
var rand5
var array1 = []
var array2 = []

# Called when the node enters the scene tree for the first time.
func _ready():
	var index = 0
	var fil = file()
	var file = File.new()
	file.open(fil, File.READ)
	while index < 150:
		var x = file.get_line()

		if fmod(index, 2) == 0:
			array1.append(x)

		else:
			array2.append(x)

		index+=1
	file.close()
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var rand = rng.randi_range(25, 453)
	$Sprite5.set_position(Vector2(rand, 162))
	$CollisionShape2D5.set_position(Vector2(rand, 162))
	var rand2 = rng.randi_range(25, 453)
	$Sprite6.set_position(Vector2(rand2, 285))
	$CollisionShape2D6.set_position(Vector2(rand2, 285))
	var rand3 = rng.randi_range(25, 453)
	$Sprite7.set_position(Vector2(rand3, 433))
	$CollisionShape2D7.set_position(Vector2(rand3, 433))
	var rand4 = rng.randi_range(25, 453)
	$Sprite8.set_position(Vector2(rand4, 569))
	$CollisionShape2D8.set_position(Vector2(rand4, 569))
	rand5 = rng.randi_range(0, 3)
	var rand6 = rng.randi_range(0, 74)
	var rand7 = rng.randi_range(-50, 50)
	var rand8 = rng.randi_range(-50, 50)
	var rand9 = rng.randi_range(-50, 50)
	if rand5 == 0:
		$Label.set_text(array2[rand6])
		$Label2.set_text(str(rand7))
		$Label3.set_text(str(rand8))
		$Label4.set_text(str(rand9))
	if rand5 == 1:
		$Label2.set_text(array2[rand6])
		$Label.set_text(str(rand7))
		$Label3.set_text(str(rand8))
		$Label4.set_text(str(rand9))
	if rand5 == 2:
		$Label3.set_text(array2[rand6]) 
		$Label2.set_text(str(rand7))
		$Label.set_text(str(rand8))
		$Label4.set_text(str(rand9))
	if rand5 == 3:
		$Label4.set_text(array2[rand6])
		$Label2.set_text(str(rand7))
		$Label3.set_text(str(rand8))
		$Label.set_text(str(rand9))

func file():
	var rng2 = RandomNumberGenerator.new()
	var file
	rng2.randomize()
	var rand = rng2.randi_range(0, 4)
	if rand == 0:
			file = "res://assets//mathematics_dataset-v1.0/train-medium/algebra__linear_1d_composed.txt"
	if rand == 1:
			file = "res://assets//mathematics_dataset-v1.0/train-medium/algebra__linear_1d.txt"
	if rand == 2:
			file = "res://assets//mathematics_dataset-v1.0/train-medium/algebra__linear_2d.txt"
	if rand == 3:
			file = "res://assets//mathematics_dataset-v1.0/train-medium/arithmetic__add_sub_multiple.txt"
	if rand == 4:
			file = "res://assets//mathematics_dataset-v1.0/train-medium/arithmetic__nearest_integer_root.txt"
	

	return file 


