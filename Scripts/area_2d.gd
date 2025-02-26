extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if body.get_name()=="Player":
		print("Hemos caído")
		get_tree().reload_current_scene()
