extends CharacterBody2D

var health=120

const SPEED = 200.0

func get_input():
	var input_direction=Input.get_vector("left","right","up","down")
	velocity=input_direction*SPEED

func _physics_process(delta: float) -> void:
	get_input()
	

	move_and_slide()
