extends CharacterBody2D;

var x_speed = 0;
@export var SPEED = 250
@export var UP: StringName;
@export var DOWN: StringName;


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	
	var y_direction = Input.get_action_strength(DOWN) - Input.get_action_strength(UP)
	#var direction = Input.get_vector()
	var direction = Vector2(x_speed, y_direction)
	velocity = direction * SPEED
	move_and_slide()
