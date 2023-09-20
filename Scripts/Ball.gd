extends CharacterBody2D;

var rng = RandomNumberGenerator.new()
var x_direction
var y_direction
var direction
var directions = [-1.0, 1.0]
@export var SPEED = 150
var start_speed: int


func _ready():
	var name = (str(self).split(':'))[0]
	#if name != Globals.gameBall:
	#	self.set_process(false)
	x_direction = directions[rng.randi_range(0, 1)]
	y_direction = directions[rng.randi_range(0, 1)]
	#print(x_direction)
	#print(y_direction)
	direction = Vector2(x_direction, y_direction)
	velocity = direction * SPEED
	start_speed = SPEED
	
	
func _on_floor_body_entered(body):
	#print(body.name)
	#print(Globals.gameBall)
	#print(body.name == Globals.gameBall)
	if(body.name == Globals.gameBall):
		print(y_direction)
		y_direction = y_direction * -1
		direction = Vector2(x_direction, y_direction)
		velocity = direction * SPEED
		print(y_direction)


func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		x_direction = collision.get_collider().BOUNCE_DIRECTION;
		y_direction = randf() * 2 - 1;
		SPEED = SPEED + 50
	
	direction = Vector2(x_direction, y_direction)
	velocity = direction * SPEED
	
	


func swapDirection():
	y_direction = y_direction * -1
	direction = Vector2(x_direction, y_direction)
	velocity = direction * SPEED

	

	
func reset():
	if(Globals.blue_score == 5 or Globals.red_score == 5):
		$"../../Game".endGame()
	else:
		print('in reset')
		SPEED = start_speed
		position = Vector2(0, -1)
		x_direction = directions[rng.randi_range(0, 1)]
		y_direction = directions[rng.randi_range(0, 1)]


func _on_red_zone_body_entered():
	# give blue player a point
	#print('in blue area!');
	Globals.blue_score += 1
	$"../UI".update_blue_score();
	reset()


func _on_blue_zone_body_entered():
	# give red player a point
	#print('in red area!');
	Globals.red_score += 1
	$"../UI".update_red_score();
	reset()
