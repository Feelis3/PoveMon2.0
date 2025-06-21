extends Control

signal dialogo_finish

@export_file("*.json") var d_file

var dialogo = []
var dialogo_actual_id = 0
var d_active = false

func _ready():
	$NinePatchRect.visible = false

func start():
	if d_active:
		return
	d_active = true
	$NinePatchRect.visible = true
	dialogo = load_dialogo()
	dialogo_actual_id = -1
	next_script()

func load_dialogo():
	var file = FileAccess.open("res://dialogos/juan_Dialogo.json", FileAccess.READ)
	var contenido = JSON.parse_string(file.get_as_text())
	return contenido

func _input(event):
	if !d_active:
		return
	if event.is_action_pressed("ui_accept"):
		next_script()

func next_script():
	dialogo_actual_id += 1
	if dialogo_actual_id >= len(dialogo):
		d_active = false
		$NinePatchRect.visible = false
		emit_signal("dialogo_finish")
		return
	
	$NinePatchRect/Name.text = dialogo[dialogo_actual_id]["name"]
	$NinePatchRect/Text.text = dialogo[dialogo_actual_id]["text"]
