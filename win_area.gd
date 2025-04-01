extends Node2D

var player1: CharacterBody2D
var player2: CharacterBody2D

func _on_area_2d_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if "Player" and "Player3" in body.name:
		return
	
