extends CharacterBody2D

@export var speed := 200
@onready var anim = $AnimacionJugador
@onready var sprite_idle = $SpriteIdle
@onready var sprite_walk = $SpriteWalk

var last_direction = "down"

func _ready():
	anim.play("idle_front")

func _physics_process(delta):
	var direccion = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = direccion * speed
	move_and_slide()

	if direccion == Vector2.ZERO:
		sprite_idle.visible = true
		sprite_walk.visible = false
		match last_direction:
			
			"up": anim.play("idle_back")
			"down": anim.play("idle_front")
			"left", "right": anim.play("idle_right")
	else:
		sprite_idle.visible = false
		sprite_walk.visible = true
		if abs(direccion.x) > abs(direccion.y):
			if direccion.x > 0:
				sprite_walk.flip_h = false
				sprite_idle.flip_h = false
				last_direction = "right"
			else:
				sprite_walk.flip_h = true
				sprite_idle.flip_h = true

				last_direction = "left"
			anim.play("walk_right")
		else:
			if direccion.y < 0:
				anim.play("walk_up")
				last_direction = "up"
			else:
				anim.play("walk_front")
				last_direction = "down"
