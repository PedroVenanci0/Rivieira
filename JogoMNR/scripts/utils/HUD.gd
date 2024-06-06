extends CanvasLayer

func _ready():
	pass
	
func _process(delta):
	update_battery(delta)
	
func update_battery(delta):
	var battery_bar : ColorRect = $Battery/MaxBattery/CurrentBattery
	var player = $"../Player"
	if player != null:
		battery_bar.rect_size.x = move_toward(344*player.battery/player.MAX_BATTERY, 0, delta)
