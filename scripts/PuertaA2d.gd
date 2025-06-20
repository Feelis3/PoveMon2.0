extends Area2D

@onready var dialog_panel = get_tree().get_current_scene().get_node("TileMap/Area2D/CanvasLayer/Panel")
@onready var dialog_label = dialog_panel.get_node("Label")

#func _input(event):
	# Detectar cuando se presiona la tecla V
	#if event is InputEventKey and event.pressed:
		#if event.keycode == KEY_V and player_in_area:
			#change_scene()

func _ready():
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)

func _on_body_entered(body):
	if body.name == "Jugador":
		dialog_panel.visible = true
		# O específicamente el panel
		dialog_panel.visible = true

func _on_body_exited(body):
	if body.name == "Jugador":
		dialog_panel.visible = false

func change_scene():
	# Método para cambiar de escena
	get_tree().change_scene_to_file("res://scenes/Menu.tscn")
