extends CanvasLayer

signal start
signal ari
signal alg
signal prob
signal calc
# sets the signals to go to each individual topic

func _on_Arithmetic_pressed():
	emit_signal("ari")
	emit_signal("start")
	# signals the arithmetic topic when that button is pressed

func _on_Algebra_pressed():
	emit_signal("alg")
	emit_signal("start")
	# signals the algebra topic when that button is pressed


func _on_Calculus_pressed():
	emit_signal("calc")
	emit_signal("start")
	# signals the calculus topic when that button is pressed


func _on_Probability_pressed():
	emit_signal("prob")
	emit_signal("start")
	# signals the probability topic when that button is pressed
