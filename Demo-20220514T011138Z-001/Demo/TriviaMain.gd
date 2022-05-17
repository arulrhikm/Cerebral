extends CanvasLayer

var xp = 0
var currency = 0
var accuracy = 0.0

func _ready():
	# displays the necessary elements at the start (call) of the game
	randomize()
	$Trivia/ColorRect.hide()
	$Trivia/HUD/ScoreLabel.hide()
	$Trivia/HUD/MessageLabel.hide()
	$Trivia/HUD/StartButton.hide()
	$Trivia/HUD/LineEdit.hide()
	$Trivia/HUD/Quit.hide()
	$Trivia/HUD/Label.hide()
	$Trivia/HUD/Label2.hide()
	$Trivia/HUD/Label3.hide()
	$Trivia/HUD/Menu.hide()
	$Trivia/HUD/CanvasLayer/Algebra.hide()
	$Trivia/HUD/CanvasLayer/Arithmetic.hide()
	$Trivia/HUD/CanvasLayer/Probability.hide()
	$Trivia/HUD/CanvasLayer/Calculus.hide()
	$Trivia/HUD/CanvasLayer/ColorRect.hide()
	$Trivia/HUD/CanvasLayer/Label.hide()
	$Level/ParallaxBackground/ParallaxLayer/Sprite.hide()
	$Level/Label.hide()
	$Level/Label2.hide()
	$Level/Label3.hide()
	$Level/Platforms.hide()
	$Level/Player.hide()
	$Level/keyboardpress.hide()
	$XP.show()
	$XP.set_text("XP: " + str(xp))
	$Currency.show()
	$Currency.set_text("Currency: " + str(currency))
	
	

func _on_Button_pressed():
	# displays new necessary elements when 'Trivia' button is clicked
	$Button.hide()
	$Button2.hide()
	$Label.hide()
	$Trivia/HUD/CanvasLayer/ColorRect.show()
	$Trivia/HUD/CanvasLayer/Label.show()
	$Trivia/HUD/CanvasLayer/Arithmetic.show()
	$Trivia/HUD/CanvasLayer/Algebra.show()
	$Trivia/HUD/CanvasLayer/Probability.show()
	$Trivia/HUD/CanvasLayer/Calculus.show()

func start():
	$Trivia.start_game()

func _on_Trivia_quit():
	_ready()
	$Label.show()
	$Button.show()
	$Button2.show()

func _on_Button2_pressed():
	# displays new necessary elements when 'Platform Jumper' button is clicked
	$Button.hide()
	$Button2.hide()
	$Level/keyboardpress.show()
	$Label.hide()
	$Level/ParallaxBackground/ParallaxLayer/Sprite.show()
	$Level/Label.show()
	$Level/Label2.show()
	$Level/Label3.show()
	$Level/Platforms.show()
	$Level/Player.show()
	
	
func _on_Trivia_trivia():
	# display setup for the trivia signal
	$Trivia/HUD/CanvasLayer/ColorRect.hide()
	$Trivia/HUD/CanvasLayer/Label.hide()
	$Trivia/HUD/CanvasLayer/Arithmetic.hide()
	$Trivia/HUD/CanvasLayer/Algebra.hide()
	$Trivia/HUD/CanvasLayer/Probability.hide()
	$Trivia/HUD/CanvasLayer/Calculus.hide()
	$Trivia/ColorRect.show()
	$Trivia/HUD/ScoreLabel.show()
	$Trivia/HUD/MessageLabel.show()
	$Trivia/HUD/StartButton.show()
	$Trivia/HUD/Menu.show()
	$Trivia/HUD/Label3.show()

func _process(_delta):
	# Calculations for XP and Currency always in background
	
	var rng = RandomNumberGenerator.new()
	# Adds random element to numbers for variability (more game-like)
	var scoreTriv = $Trivia/HUD.score 
	var countTriv = $Trivia/HUD.count
	var scoreJumper = $Level.score
	var countJumper = scoreJumper + 5
	# Trivia calculations:
	if countTriv>0:
	# removes /0 case
		accuracy = (scoreTriv / countTriv)
		# calculates accuracy of study session
		# calculate XP:
		#(probably need some XP label in one of the corners)
		xp += (countTriv * 150 + rng.randi_range(1,99))
		# calculate currency
		# need label too lol in the corner or smth
		currency += (accuracy * 100 + rng.randi_range(1,10))
	# Calculates XP and Currency with algorithm and adds to existing value
	
	# Platform Jumper calculations:
	# Does the same as above but with Platform Jumper numbers
	accuracy = (scoreJumper / countJumper)
	# calculates accuracy of study session
	# calculate XP:
	#(probably need some XP label in one of the corners)
	xp += (countJumper * 150 + rng.randi_range(1,99))
	# calculate currency
	# need label too lol in the corner or smth
	currency += (accuracy * 100 + rng.randi_range(1,10))
	
"""
func calculate(score, count):
	var rng = RandomNumberGenerator.new()
	var accuracy = (score / count)
	# calculates accuracy of study session
	# calculate XP:
	#(probably need some XP label in one of the corners)
	xp += (count * 150 + rng.randi_range(1,99))
	# calculate currency
	# need label too lol in the corner or smth
	currency += (accuracy * 100 + rng.randi_range(1,10))
	"""
