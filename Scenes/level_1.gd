extends Node2D

@export var next_level: PackedScene
@export var main_menu: PackedScene

@onready var level_completed = $CanvasLayer/LevelCompleted

func _ready():
	Events.level_completed.connect(show_level_completed)
	
func go_to_next_leve():
	if next_level is PackedScene:
		get_tree().paused = false
		get_tree().change_scene_to_packed(next_level)
	else:
		get_tree().change_scene_to_packed(main_menu)
	
func retry():
	get_tree().paused = false
	get_tree().change_scene_to_file(scene_file_path)
	
	
func show_level_completed():
	level_completed.show()
	level_completed.retry_button.grab_focus()
	get_tree().paused = true


func _on_level_completed_next_level():
	go_to_next_leve()


func _on_level_completed_retry():
	retry() # Replace with function body.
