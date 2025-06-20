extends Node2D

func _on_opciones_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Opciones.tscn")

func _on_salir_pressed() -> void:
	get_tree().quit()


func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Juego.tscn")
