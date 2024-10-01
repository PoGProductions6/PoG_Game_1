extends CharacterBody2D


var health=100
const SPEED = 160.0

var player=Player
var is_chasing_player = false

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player":  # Ensure the body is the player	
		player = body as CharacterBody2D  # Cast the body to CharacterBody2D
		is_chasing_player = true  # Start chasing the player

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name == "Player":  # Ensure the body is the player
		player = body as CharacterBody2D  # Cast the body to CharacterBody2D
		is_chasing_player = false  # Stop chasing the player

func _physics_process(delta):
	if is_chasing_player and player:
		var player_position = player.global_position
		var enemy_position = global_position
	
		var direction = player_position - enemy_position
		direction = direction.normalized()
			
		var motion = direction * SPEED * delta
		move_and_collide(motion)




func _on_hit_box_body_entered(body: Node2D) -> void:
	pass # Replace with function body.



func _on_hit_box_body_exited(body: Node2D) -> void:
	pass # Replace with function body.
