extends Node2D

# Definir las resoluciones disponibles
var resolutions = [
	Vector2(800, 600),
	Vector2(1024, 768),
	Vector2(1280, 720),
	Vector2(1920, 1080)
]

# Índice de la resolución actual
var current_resolution_index = 0


func _on_atras_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Menu.tscn")


func _on_resolucion_pressed() -> void:
	current_resolution_index = (current_resolution_index + 1) % resolutions.size()
	var new_resolution = resolutions[current_resolution_index]

	# Asegurar modo ventana (por si estaba en fullscreen)
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	
	# Aplicar nueva resolución
	DisplayServer.window_set_size(new_resolution)

	# Opcional: mover la ventana para confirmar visualmente
	DisplayServer.window_set_position(Vector2(100, 100))

	# Confirmar en consola
	print("Resolución cambiada a: ", new_resolution)
