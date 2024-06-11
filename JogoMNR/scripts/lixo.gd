extends KinematicBody2D
class_name Lixo

onready var dificuldade_timer = $DificuldadeTimer
onready var battery_bar : ColorRect = $Battery/MaxBattery/CurrentBattery

onready var lixo = $"."
onready var sprite = $Sprite
onready var assets = [preload("res://assets/trash/Screenshot_from_2024-06-07_14-50-59-removebg-preview.png"),
	preload("res://assets/trash/Screenshot_from_2024-06-07_14-51-18-removebg-preview.png"),
	preload("res://assets/trash/Screenshot_from_2024-06-07_14-51-30-removebg-preview.png"),
	preload("res://assets/trash/Screenshot_from_2024-06-07_14-51-43-removebg-preview.png"),]

var progresso = 0
var progresso_max = 100
var speed_add = 1


func _ready():
	sprite.texture = get_random_texture()
	
	$Progresso.visible = false
	

func _process(delta):
	lixo.position.x -= speed_add
	$Label.text = str(progresso)
	$Progresso/Barra.rect_size.x = 36 * progresso / progresso_max

func aumentar_progresso() -> void:
	progresso += 1.5
	$Progresso.visible = progresso > 0  # Exibir Progresso quando progresso > 0
	if progresso >= 100:
		Global.score += 100
		print(Global.score)
		print("XAMA GOSTOSO")
		var player = get_node("/root/Node2D/Player");
		if player.has_method("add_battery"):
			player.add_battery();
		print(player)
		queue_free()

func resetar_progresso() -> void:
	progresso = 0
	$Progresso.visible = false

func get_random_texture() -> Texture:
	# Obtém um índice aleatório dentro do intervalo de 0 ao tamanho da lista de texturas - 1
	var random_index = randi() % assets.size()
	# Retorna a textura correspondente ao índice aleatório
	return assets[random_index]
	
	
func _on_DificuldadeTimer_timeout():
	dificuldade_timer.start()
	speed_add += 0.5
	print("nicolau")
