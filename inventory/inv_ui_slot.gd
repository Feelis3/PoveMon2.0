extends Panel

@onready var item_visual: Sprite2D = $CenterContainer/Panel/item_display
@onready var item_cant: Label = $CenterContainer/Panel/item_cant
func _ready():
	item_visual.scale = Vector2(0.015, 0.015)


func update(item: InvItem):
	if !item:
		item_visual.visible = false
	else:
		item_visual.visible = true
		item_visual.texture = item.texture
		item_cant.text = "x" + str(item.cantidad)
