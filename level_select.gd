extends Button




func _on_pressed() -> void:
	pass # Replace with function body.


func _on_level_1_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Level1.tscn")
	pass # Replace with function body.
	
func _on_level_2_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Level2.tscn")
	pass # Replace with function body.
	
func _on_level_3_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Level3.tscn")
	pass # Replace with function body.
	
func _on_level_4_pressed() -> void:
	pass # Replace with function body.


func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
	pass # Replace with function body.
