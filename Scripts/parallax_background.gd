extends ParallaxBackground

func _process(delta):

	var velocidad = 10
	scroll_offset -= velocidad * delta
