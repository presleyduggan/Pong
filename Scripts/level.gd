extends Node2D

@onready var gameOverUI = $"UI/Game Over"

func _ready():
	for ball in Globals.balls:
		if(ball != Globals.gameBall):
			self.remove_child(get_node(ball))
			#get_node(ball).set_process(false)
				
func endGame():
	Globals.red_score = 0
	Globals.blue_score = 0
	#print('game over!')
	gameOverUI.visible = true
	
	
func resetGame():
	gameOverUI.visible = false
	$UI.update_blue_score()
	$UI.update_red_score()
	get_node(Globals.gameBall).reset()


func _on_ui_play_again_pressed():
	resetGame()


func _on_ui_quit_pressed():
	Globals.goto_scene(Globals.mainMenu)


func _on_floor_body_entered(body):
	if(body.name == Globals.gameBall):
		get_node(Globals.gameBall).swapDirection()


func _on_ceiling_body_entered(body):
	if(body.name == Globals.gameBall):
		get_node(Globals.gameBall).swapDirection()
