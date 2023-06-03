extends CharacterBody2D

@export var speed: int = 45
@onready var animations = $AnimationPlayer
var direction = "Down" 

func handleInput():
	var moveDirection = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = moveDirection * speed
	
	
func updateAnimation():
	if velocity.x < 0: direction = "Left"
	elif velocity.x > 0: direction = "Right"
	elif velocity.y < 0: direction = "Up"
	elif velocity.y > 0: direction = "Down"
	
	if velocity.x == 0 and velocity.y == 0 : 
		animations.play("stand" + direction)
	
	else:
		animations.play("walk" + direction)
	
func _physics_process(_delta):
	handleInput()
	move_and_slide()
	updateAnimation()
