extends CharacterBody2D

@onready var animation = $AnimationPlayer


func _physics_process(delta):
	animation.play("animation")
