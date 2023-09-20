extends Node2D



func _on_play_pressed():
	Globals.goto_scene(Globals.gameLevel)


func _on_settings_pressed():
	$"CanvasLayer/ColorRect/Menu/Buttons".visible = false;
	$"CanvasLayer/ColorRect/Menu/Popup".visible = true;


func _on_quit_pressed():
	get_tree().quit()


func _on_return_pressed():
	$"CanvasLayer/ColorRect/Menu/Popup".visible = false;
	$"CanvasLayer/ColorRect/Menu/Buttons".visible = true;
	


func _on_ball_chooser_item_selected(index):
	Globals.changeGameBall(index)
