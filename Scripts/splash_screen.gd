extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _input(event):
	if event.is_pressed():
		get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
