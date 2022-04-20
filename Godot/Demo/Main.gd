extends Node

export(PackedScene) var mob_scene
signal quit 
signal trivia

func _ready():
	randomize()

func game_over():
	$HUD.show_game_over()
	$Music.stop()
	$DeathSound.play()

func new_game():
	$HUD.score = 0
	$HUD.update_score($HUD.score)
	$HUD.show_message("Get Ready", 1.0)
	$Music.play()
	yield(get_tree().create_timer(1.0), "timeout")
	$HUD.new_question()

func _on_StartTimer_timeout():
	$ScoreTimer.start()

func _on_HUD_quit_game():
	emit_signal("quit")

func _on_HUD_start_trivia():
	emit_signal("trivia")
