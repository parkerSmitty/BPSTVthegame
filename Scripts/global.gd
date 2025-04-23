extends Node

var game_controller : GameController

func _ready():
	game_controller = GameController.new()
	add_child(game_controller)
