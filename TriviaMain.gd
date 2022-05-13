extends CanvasLayer

func _ready():
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
	
	

func _on_Button_pressed():
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
	$Button.hide()
	$Button2.hide()
	$Label.hide()
	$Level/ParallaxBackground/ParallaxLayer/Sprite.show()
	$Level/Label.show()
	$Level/Label2.show()
	$Level/Label3.show()
	$Level/Platforms.show()
	$Level/Player.show()
	
	
func _on_Trivia_trivia():
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
