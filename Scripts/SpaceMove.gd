extends Sprite2D

var x_max = 9
var y_max = 9
@export var x_move = 0
@export var y_move = 0
var rng = RandomNumberGenerator.new()
@export var timer = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	timer = timer + delta
	
	# movement
	if timer > 2:
		timer = 0
		var random_x = rng.randi_range(-1, 1)
		var random_y = rng.randi_range(-1, 1)
	
		
		
		# don't move out of the background
		if x_max <= abs(x_move):
			random_x = -1 * getSign(x_move)
			print("randomx = "+ str(random_x) + " and x_move = " + str(x_move))
			#x_move += random_x
		
		if y_max <= abs(y_move):
			random_y = -1 * getSign(y_move)
			#y_move += random_y
			
		x_move = x_move + random_x
		y_move += random_y
		
		position.x = position.x + random_x
		position.y = position.y + random_y
	

func getSign(num):
	if num >= 0:
		return 1
	return -1
