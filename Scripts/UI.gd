extends CanvasLayer

@onready var blue_label: Label = $"Blue Score/Label"
@onready var red_label: Label = $"Red Score/Label"

signal play_again_pressed()
signal quit_pressed()



func update_blue_score():
	blue_label.text = "Score: " + str(Globals.blue_score)
	
func update_red_score():
	red_label.text = "Score: " + str(Globals.red_score)


func _on_play_again_button_pressed():
	play_again_pressed.emit()


func _on_quit_game_pressed():
	quit_pressed.emit()
