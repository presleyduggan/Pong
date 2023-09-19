extends CharacterBody2D;

var x_speed = 0;
@export var SPEED = 400
@export var UP: StringName;
@export var DOWN: StringName;
@export var MAX_HEIGHT: int;
@export var MIN_HEIGHT: int;
@export var BOUNCE_DIRECTION = 1;


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	
	var y_direction = Input.get_action_strength(DOWN) - Input.get_action_strength(UP)
	
	if((y_direction < 0) && global_position.y <= MAX_HEIGHT):
		y_direction = 0;
		
	if((y_direction > 0) && global_position.y >= MIN_HEIGHT):
		y_direction = 0;
		
	var direction = Vector2(x_speed, y_direction)
	velocity = direction * SPEED
	move_and_slide()
