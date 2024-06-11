extends CanvasLayer

onready var label_score = $Pontos

func _ready():
	pass
	
func _process(delta):
	update_battery(delta)
	label_score.text = "Pontos: " + str(Global.score)
	

func update_battery(delta):
	var battery_bar : ColorRect = $Battery/MaxBattery/CurrentBattery
	var player = $"../Player"
	if player != null:
		var _batteryTo = 344 * player.battery / player.MAX_BATTERY; # destino
		var _diff = abs(_batteryTo - battery_bar.rect_size.x); # diferenca entre o antes e o depois
		var _sp = _diff / 15;
		battery_bar.rect_size.x = move_toward(battery_bar.rect_size.x, _batteryTo, _sp);
	
#		# Colorir barra
#		battery_bar.modulate = Color.red if _diff > 2 else Color.white
			

