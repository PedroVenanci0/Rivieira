extends Label

onready var slider: Slider = $".."

func _process(delta):
	self.text = str(slider.value)
