extends CharacterBody2D


var health=120
var attack_type:String
var current_attack:bool



const SPEED = 200.0

#dash speed and activation
const DASH_SPEED=600
var dashing=false
var can_dash=true

func _ready():
	current_attack=false

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

		
func _physics_process(delta: float) -> void:
	get_input()
	if !current_attack:
		if Input.is_action_just_pressed("left_click") or Input.is_action_just_pressed("right_click"):
			current_attack=true
			if Input.is_action_just_pressed("left_click"):
				attack_type="jab"
			elif Input.is_action_just_pressed("right_click"):
				attack_type="swing"
	
	move_and_slide()

#expire timers for dash
func _on_dash_timer_timeout() -> void:
	dashing=false
func _on_dash_again_timeout() -> void:
	can_dash=true
