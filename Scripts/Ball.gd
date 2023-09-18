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
	
	
#func _process(delta):
	#var direction = Vector2(x_direction, y_direction)
	#velocity = direction * SPEED
	#move_and_slide()
	


func _on_floor_body_entered(body):
	y_direction = y_direction * -1
	print('test')
	

func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		x_direction = x_direction * -1
		
		#if collision.get_collider().has_method("hit"):
		#	collision.get_collider().hit()
	direction = Vector2(x_direction, y_direction)
	velocity = direction * SPEED
	
	


func _on_ceiling_body_entered(body):
	y_direction = y_direction * -1
	print('test')
