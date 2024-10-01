extends Node2D

func _ready() -> void:
	if SceneManager.player:
		add_child(SceneManager.player)
