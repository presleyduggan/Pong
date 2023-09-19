extends CharacterBody2D;

var rng = RandomNumberGenerator.new()
var x_direction
var y_direction
var direction
var directions = [-1.0, 1.0]
@export var SPEED = 100


func _ready():
	x_direction = directions[rng.randi_range(0, 1)]
	y_direction = directions[rng.randi_range(0, 1)]
	print(x_direction)
	print(y_direction)
	direction = Vector2(x_direction, y_direction)
	velocity = direction * SPEED
	
	
func _on_floor_body_entered(body):
	if(body.name == 'Ball'):
		y_direction = y_direction * -1


func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	var n = String(name).to_lower()
	if collision:
		x_direction = collision.get_collider().BOUNCE_DIRECTION;
		y_direction = randf() * 2 - 1;
		SPEED = SPEED + 50
	
	direction = Vector2(x_direction, y_direction)
	velocity = direction * SPEED
	
	


func _on_ceiling_body_entered(body):
	if(body.name == 'Ball'):
		y_direction = y_direction * -1

	
func reset():
	SPEED = 50;
	position = Vector2(0, -1)
	x_direction = directions[rng.randi_range(0, 1)]
	y_direction = directions[rng.randi_range(0, 1)]


func _on_red_zone_body_entered(body):
	# give blue player a point
	print('in blue area!');
	reset()


func _on_blue_zone_body_entered(body):
	# give red player a point
	print('in red area!');
	reset()
