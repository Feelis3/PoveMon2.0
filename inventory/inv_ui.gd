extends Control
@onready var inv: Inventory = preload("res://inventory/playerinv.tres")
@onready var slots: Array = $NinePatchRect/GridContainer.get_children()
@onready var objetoLabel: Label = $NinePatchRect2/Label
var is_open = false

func _ready():
	update_slots()
	connect_slot_signals()
	close()

func connect_slot_signals():
	for i in range(slots.size()):
		if slots[i].has_signal("mouse_entered"):
			slots[i].mouse_entered.connect(_on_slot_mouse_entered.bind(i))
			slots[i].mouse_exited.connect(_on_slot_mouse_exited.bind(i))

func _on_slot_mouse_entered(slot_index: int):
	if slot_index < inv.items.size() and inv.items[slot_index] != null:
	
		objetoLabel.text = inv.items[slot_index].name

func _on_slot_mouse_exited(slot_index: int):
			objetoLabel.text = ""

	

	

func _on_mouse_entered():
	print("Ratón encima del slot")
	# Aquí puedes cambiar el color, mostrar tooltip, etc.
	modulate = Color.YELLOW

func _on_mouse_exited():
	print("Ratón salió del slot")
	# Restaurar apariencia normal
	modulate = Color.WHITE

func update_slots():
	for i in range(min(inv.items.size(),slots.size())):
		slots[i].update(inv.items[i])
		
	
func _process(delta: float):
	if Input.is_action_just_pressed("ui_e"):
		if is_open:
			close()
		else:
			open()
	
func open():
	visible = true
	is_open = true	
	
func close():
	visible = false
	is_open = false
