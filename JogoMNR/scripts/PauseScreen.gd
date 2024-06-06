extends Control

func _ready():
	visible = false

func _process(_delta):
	if Input.is_action_just_pressed("ui_cancel") and Global.can_pause:
		pause_or_resume()
		$VBoxContainer/Resumir.grab_focus()
		


func _on_Resumir_pressed():
	pause_or_resume()
	
func pause_or_resume():
	visible = !visible
	get_tree().paused = !get_tree().paused 
