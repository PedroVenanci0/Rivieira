extends KinematicBody2D

onready var SPEED = 2
var MAX_BATTERY = 5
onready var battery = MAX_BATTERY
var velocity : Vector2

func _ready():
	pass
	
	

func _physics_process(_delta):
	movement()
	move_and_slide(velocity*SPEED)

func movement():
	velocity = Input.get_vector("left","right","up","down")*100

#	if SerialCom.port != null:
#		velocity.x = SerialCom.accelerometerTiltX
#		velocity.x = min(velocity.x, 120)
#		velocity.x = max(velocity.x, -120)
#		velocity.y = SerialCom.accelerometerTiltY
#		velocity.y = min(velocity.y, 80)
#		velocity.y= max(velocity.y, -80)
#		velocity.normalized()
		
		
#	print(velocity.y)

## Diminuir a bateria
func _on_BatteryTimer_timeout():
	battery = max(battery-1, 0);
	print(battery)
	$BatteryTimer.start()

## Aumentar bateria
func add_battery() -> void:
	battery = clamp(battery+5, 1, MAX_BATTERY);
	print(battery)



