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
	
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#       CHARACTER CONNECTION DEATH LOGIC (Copied from level_1.gd but changed max_distance)
# Maximum allowed distance between the players.
@export var max_distance: float = 350.0

# References to the player nodes. Adjust the paths to match your scene.
@onready var player1 = $Character/Player  # Replace with your actual node path
@onready var player2 = $Character/Player3  # Replace with your actual node path

# Reference to the red overlay node (ColorRect) on the CanvasLayer.
@onready var warning_overlay = $CanvasLayer/Warning  # Ensure the path matches your scene

func _process(_delta):
	update_warning_effect()
	check_distance()

# Update the red overlay's transparency based on the distance between players.
func update_warning_effect():
	var distance = player1.position.distance_to(player2.position)
	var warning_threshold = 0.7 * max_distance  # Warning starts at 70% of max_distance
	var new_alpha: float = 0.0

	if distance < warning_threshold:
		new_alpha = 0.0
	elif distance < max_distance:
		# Interpolate alpha from 0 (at warning_threshold) to 1 (at max_distance)
		new_alpha = (distance - warning_threshold) / (max_distance - warning_threshold)
	else:
		new_alpha = 1000.0

	# Set the overlay's alpha; 1.0 means fully opaque, 0.0 is transparent.
	warning_overlay.modulate.a = new_alpha

# Check if the players have exceeded the maximum allowed distance.
func check_distance():
	var distance = player1.position.distance_to(player2.position)
	if distance > max_distance:
		handle_death()

# Handle the game-over logic when the players are too far apart.
func handle_death():
	await get_tree().create_timer(2).timeout
	get_tree().change_scene_to_file(scene_file_path)
	# Insert additional game over logic here (e.g., reset the level, display a UI, etc.)
