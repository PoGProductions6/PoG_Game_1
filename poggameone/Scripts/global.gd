
extends Node

@onready var player: Player=$Player

func _ready():
	if SceneManager.player:
		if player:
			player.queue_free()
		player=SceneManager.player
		add_child(player)
