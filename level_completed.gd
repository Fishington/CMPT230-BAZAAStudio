extends ColorRect

signal retry()
signal next_level()

@onready var retry_button: Button = %Retry


func _on_retry_pressed():
	#print("Retry")
	retry.emit()


func _on_next_level_pressed():
	#print("Next Level")
	next_level.emit()
