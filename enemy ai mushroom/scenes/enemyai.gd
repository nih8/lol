extends CharacterBody2D

var speed = 50
var player_chase = false
var player = null
var direction = 1
var patrol_distance = 100  # pixels
var patrol_origin = Vector2.ZERO  # store the starting position
@onready var ray_cast_2d: RayCast2D = $RayCast2D
@onready var ray_cast_2d_2: RayCast2D = $RayCast2D2
func _ready():
	patrol_origin = position  # store the starting position

func _physics_process(delta: float) -> void:
	if player_chase:
		position += (player.position-position)/speed
	else:
		position.x += direction * speed * delta

		var distance_from_origin = position.x - patrol_origin.x
		if abs(distance_from_origin) >= patrol_distance:
			direction *= -1  # flip direction
		
		
	
		
		
		


func _on_area_2d_body_entered(body: Node2D) -> void:
	player = body
	player_chase = true

	


func _on_area_2d_2_body_entered(body: Node2D) -> void:
	pass
