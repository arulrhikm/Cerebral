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
	# initializes variables at start of new game
	$HUD.score = 0
	$HUD.update_score($HUD.score)
	$HUD.show_message("Get Ready", 1.0)
	$Music.play()
	yield(get_tree().create_timer(1.0), "timeout")
	$HUD.new_question()

func _on_StartTimer_timeout():
	# starts timer
	$ScoreTimer.start()

func _on_HUD_quit_game():
	# quits
	emit_signal("quit")

func _on_HUD_start_trivia():
	# starts
	emit_signal("trivia")
