extends StaticBody2D

onready var lixo = $"."


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	lixo.position.x -= 1


func _on_VisibilityNotifier2D_screen_exited():
	print("sai")
	queue_free()
