extends Node2D

var i = 0
var scenes = ["res://Scenes/tutorial.tscn","res://Scenes/Main.tscn", "res://Scenes/Main2.tscn", "res://Scenes/Main3.tscn", "res://Scenes/Main4.tscn", "res://Scenes/Main5.tscn", "res://Scenes/Main6.tscn", "res://Scenes/Main7.tscn", "res://Scenes/Main8.tscn", "res://Scenes/Main9.tscn", "res://Scenes/Main10.tscn", "res://Scenes/Outro.tscn", "res://Scenes/global_scene.tscn"]
const SAVE_PATH = "user://saveFile.save"

func _ready():
	pass

func save_data():
	var file = File.new()
	file.open(SAVE_PATH, File.WRITE)
	file.store_var(i)
	file.close()
	print(File.WRITE)

func load_data():
	var file = File.new()
	if not file.file_exists(SAVE_PATH):
		i = 0
	file.open(SAVE_PATH, File.READ)
	i = file.get_var()
	file.close()
