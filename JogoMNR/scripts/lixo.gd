extends KinematicBody2D
class_name Lixo
onready var lixo = $"."

var progresso = 0
var progresso_max = 100


# Called when the node enters the scene tree for the first time.
func _ready():
	$Progresso.visible = false


func _process(delta):
	lixo.position.x -= 1
	$Label.text = str(progresso)
	$Progresso/Barra.rect_size.x = 36 * progresso/progresso_max
	

func aumentar_progresso() -> void:
	progresso += 0.5;
	$Progresso.visible = true if progresso > 0 else false;
	if progresso >= 100:
		print("XAMA GOSTOSO");
		queue_free();
	
func resetar_progresso() -> void:
	progresso = 0;
	$Progresso.visible = false;
	
