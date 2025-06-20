extends CharacterBody2D

@export var speed := 200
@onready var anim = $AnimacionJugador
@onready var sprite = $Sprite  # Asegúrate de cambiar el nombre si es distinto

var last_direction = "down"

func _ready():
	anim.play("idle_front")

func _physics_process(delta):
	var direccion = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = direccion * speed
	move_and_slide()

	if direccion == Vector2.ZERO:
		match last_direction:
			"up": anim.play("idle_back")
			"down": anim.play("idle_front")
			"left", "right": anim.play("idle_right")
	else:
		if abs(direccion.x) > abs(direccion.y):
			if direccion.x > 0:
				sprite.flip_h = false
				last_direction = "right"
			else:
				sprite.flip_h = true

				last_direction = "left"
			anim.play("idle_right")
		else:
			if direccion.y < 0:
				anim.play("idle_back")
				last_direction = "up"
			else:
				anim.play("idle_front")
				last_direction = "down"
