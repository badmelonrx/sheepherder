extends KinematicBody2D
signal prompt(text)

var following = null
var speed = 80
var player_in_range = null
# Called when the node enters the scene tree for the first time.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var velocity = Vector2.ZERO
	if following:
		print(following.position.distance_to(position))
		velocity = position.direction_to(following.position).normalized() * speed
		if following.position.distance_to(position) > 100:
			following = null
		elif following.position.distance_to(position) < 40:
			velocity = Vector2.ZERO
	move_and_slide(velocity)
	
	if player_in_range && Input.is_action_pressed("interact"):
		following = player_in_range
		player_in_range = null
		$Outline.hide()
		
func _ready():
	$Outline.hide()

func player_interaction(player):
	following = player
	

func _on_InteractRadius_body_entered(body):
	if body.is_in_group("player"):
		emit_signal("prompt", "press e to indoctrinate")
		$Outline.show()
		player_in_range = body
		
func _on_InteractRadius_body_exited(body):
	if body.is_in_group("player"):
		$Outline.hide()
		player_in_range = null
