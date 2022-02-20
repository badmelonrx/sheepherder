extends KinematicBody2D
signal prompt(text)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


var speed = 100
var velocity = Vector2.ZERO
var focus = null

func _physics_process(delta):
	var direction = Vector2.ZERO
	
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
	if Input.is_action_pressed("ui_right"):
		direction.x += 1
	if Input.is_action_pressed("ui_down"):
		direction.y += 1
	if Input.is_action_pressed("ui_up"):
		direction.y -= 1
	
	if focus and Input.is_action_just_pressed("interact"):
		focus.player_interaction($Player)
	
	velocity = direction.normalized() * speed

	move_and_slide(velocity)


