extends Node

var player = Player
var scene_dir_path = "res://Scenes/"

func change_scene(from, to_scene_name:String) -> void:
	if Player and Player.get_parent():
		Player.get_parent().remove_child(Player)
	
	var full_path=scene_dir_path+to_scene_name+".tscn"
	from.get_tree().call_deferred("change_scene_to_file", full_path)
	
