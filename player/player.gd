extends CharacterBody2D

@export var speed: int = 45
@onready var _animated_sprite = $AnimatedSprite2D

func handleInput():
	var moveDirection = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = moveDirection * speed
	
	
func updateAnimation():
	if velocity.length() == 0:
		_animated_sprite.stop()
	var direction = "Down"
	if velocity.x < 0: direction = "Left"
	elif velocity.x > 0: direction = "Right"
	elif velocity.y < 0: direction = "Up"
	
	_animated_sprite.play("walk" + direction)
	
func _physics_process(_delta):
	handleInput()
	move_and_slide()
	updateAnimation()
