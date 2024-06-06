extends KinematicBody2D

onready var SPEED = 10
var MAX_BATTERY = 5
var battery = MAX_BATTERY

func _ready():
	pass
	
	

func _physics_process(_delta):
	move_and_slide(movement())

func movement():
	var direction = Vector2 (
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up")
	)
	direction.x = int(SerialCom.msgArray[0]);
	direction.y = int(SerialCom.msgArray[1]);
	print(direction)
	
	return (direction*SPEED)

## Diminuir a bateria
func _on_BatteryTimer_timeout():
	battery = max(battery-1, 0)
#	print(battery)
	$BatteryTimer.start()




