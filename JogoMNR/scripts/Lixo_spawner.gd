extends Node2D
onready var top = $Top
onready var botttom = $Botttom
onready var lixo = preload("res://scenes/lixo.tscn")
onready var spawn_timer: Timer = $SpawnTimer


func _ready():
	spawn_timer.start()

func _on_SpawnTimer_timeout():
	spawn_lixo(lixo)
	spawn_timer.start()

func spawn_lixo(lixo):
	var novo_lixo = lixo.instance()
	novo_lixo.global_position = get_randon_position()
	add_child(novo_lixo)
	
func get_randon_position():
	return Vector2(top.global_position.x,rand_range(botttom.global_position.y,top.global_position.y))



	
