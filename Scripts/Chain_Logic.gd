extends Node

@export var max_distance: float = 200.0  # Maximum distance allowed
@onready var character1 = $Player    # Adjust node paths as needed
@onready var character2 = $Player3
@onready var warning_overlay = $CanvasLayer/WarningOverlay  # Path to your overlay

func _process(delta):
	update_warning_effect()
	check_distance()

func update_warning_effect():
	# Calculate the current distance between the two characters
	var distance = character1.position.distance_to(character2.position)
	
	# Normalize the distance to get a value between 0 and 1
	var intensity = clamp(distance / max_distance, 0.0, 1.0)
	
	# Adjust the alpha based on intensity (0 = no warning, up to 0.8 = full warning)
	warning_overlay.modulate.a = intensity * 0.8

func check_distance():
	var distance = character1.position.distance_to(character2.position)
	if distance > max_distance:
		handle_death()

func handle_death():
	print("The characters are too far apart! Game Over.")
	# Here you can add your game over logic: restart the level, show a game over screen, etc.
