extends CharacterBody2D

@export var move_speed: float
@export var jump_speed: float
@onready var animate_sprite = $AnimatedSprite2D
var is_facing_right = true
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	jump(delta)
	move_x()
	flip()
	update_animation()
	move_and_slide()
	
func update_animation():
	if not is_on_floor():
		if velocity.y < 0:
			animate_sprite.play("jump")
		else:
			animate_sprite.play("fall")
		return
	
	if velocity.x:
		animate_sprite.play("run")
	else:
		animate_sprite.play("idle")
	
func jump(delta):
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = -jump_speed
	
	if not is_on_floor():
		velocity.y +=gravity * delta
		
func flip():
	if (is_facing_right and velocity.x < 0) or (not is_facing_right and velocity.x > 0):
		scale.x *= -1
		is_facing_right = not is_facing_right
	
func move_x():
	var input_axis = Input.get_axis("move_left","move_right")
	velocity.x = input_axis * move_speed
