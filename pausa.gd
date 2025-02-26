extends CanvasLayer

@onready var player = $AudioStreamPlayer
func _physics_process(delta):
	if Input.is_action_just_pressed("pausa"):
		player.play()
		get_tree().paused = not get_tree().paused
		$ColorRect.visible = not $ColorRect
		$Label.visible = not $Label.visible
