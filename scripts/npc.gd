extends CharacterBody2D

const speed = 30
var current_state = IDLE

var dir = Vector2.RIGHT
var start_pos

var is_roaming = true
var is_chatting = false

var player
var player_in_chat_zone = false

enum {
	IDLE,
	NEW_DTR,
	MOVE
}

func _ready():
	randomize()
	start_pos = position

func _process(delta):
	if current_state == 0 or current_state == 1:
		$AnimatedSprite2D.play("idol")
	elif current_state == 2 and !is_chatting:
		if dir.x == -1:
			$AnimatedSprite2D.play("walk_o")
		if dir.x == 1:
			$AnimatedSprite2D.play("walk_e")
			
	if is_roaming:
		match current_state:
			IDLE:
				pass
			NEW_DTR:
				dir = choose([Vector2.RIGHT, Vector2.UP, Vector2.LEFT, Vector2.DOWN])
			MOVE:
				move(delta)
	if Input.is_action_just_pressed("chat"):
		print("chatting with npc")
		$Dialogo.start()
		is_roaming = false
		is_chatting = false
		$AnimatedSprite2D.play("idol")

func choose(array):
	array.shuffle()
	return array.front()

func move(delta):
	if !is_chatting:
		position += dir * speed * delta



func _on_a_deteccion_chat_body_entered(body: Node2D) -> void:
	if body.has_method("Jugador"):
		player = body
		player_in_chat_zone = true


func _on_a_deteccion_chat_body_exited(body: Node2D) -> void:
	if body.has_method("Jugador"):
		player_in_chat_zone = false




func _on_timer_timeout() -> void:
	$Timer.wait_time = choose([0.5, 1, 1.5])
	current_state = choose([IDLE, NEW_DTR, MOVE])
	


func _on_dialogo_dialogo_finish() -> void:
	is_chatting = false
	is_roaming = true
