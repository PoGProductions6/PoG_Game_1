extends CharacterBody2D

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D


var last_direction="front"
const SPEED = 200.0

#dash speed and activation
const DASH_SPEED=600
var dashing=false
var can_dash=true



func get_input():
	var input_direction=Input.get_vector("left","right","up","down")
	velocity=input_direction*SPEED
	
	
	#activate dash and start timers
	if Input.is_action_just_pressed("dash") and can_dash:
		dashing=true
		can_dash=false
		$timers/dash_timer.start()
		$timers/dash_again.start()
	
	#implement dash speed
	if dashing:
		velocity=input_direction*DASH_SPEED
	else:
		velocity=input_direction*SPEED
		
		if dashing and input_direction=="left":
			animated_sprite.animation = "dash_left"
		elif dashing and input_direction=="right":
			animated_sprite.animation = "dash_right"
		elif dashing and input_direction=="front":
			animated_sprite.animation = "dash_front"
		elif dashing and input_direction=="back":
			animated_sprite.animation = "dash_back"
		
func _physics_process(delta: float) -> void:
	get_input()
	if velocity.x > 0:
		animated_sprite.animation = "run_right"
		last_direction="right"
	elif velocity.x < 0:
		animated_sprite.animation = "run_left"
		last_direction="left"
	elif velocity.y > 0:
		animated_sprite.animation = "run_front"
		last_direction="front"
	elif velocity.y < 0:
		animated_sprite.animation = "run_back"
		last_direction="back"
	else:
		if last_direction == "right":
			animated_sprite.animation = "idle_right"
		elif last_direction == "left":
			animated_sprite.animation = "idle_left"
		elif last_direction == "back":
			animated_sprite.animation = "idle_back"
		elif last_direction == "front":
			animated_sprite.animation = "idle_front"

	
	move_and_slide()

#expire timers for dash
func _on_dash_timer_timeout() -> void:
	dashing=false
func _on_dash_again_timeout() -> void:
	can_dash=true
