extends KinematicBody2D

onready var SPEED = 400

func _ready():
	pass
	

func _physics_process(_delta):
	move_and_slide(movement())

func movement():
	var direction = Vector2 (
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up")
	)
	
	return (direction*SPEED)
