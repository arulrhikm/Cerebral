extends CanvasLayer

signal start
signal ari
signal alg
signal prob
signal calc

func _on_Arithmetic_pressed():
	emit_signal("ari")
	emit_signal("start")

func _on_Algebra_pressed():
	emit_signal("alg")
	emit_signal("start")


func _on_Calculus_pressed():
	emit_signal("calc")
	emit_signal("start")


func _on_Probability_pressed():
	emit_signal("prob")
	emit_signal("start")
