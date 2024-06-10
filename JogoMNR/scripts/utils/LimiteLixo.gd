extends Area2D


func _ready():
	pass
	
func _on_LimiteLixo_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body.has_method("resetar_progresso"):
		print("Um lixo entrou em mim");
		Global.score -= 25
		body.queue_free()

