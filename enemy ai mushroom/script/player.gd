extends CharacterBody2D


var speed = 200
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var interact_ui= $InteractUI


func _ready() -> void:
	Global.set_player_reference(self)


func get_input():
	var input_direction = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	velocity = input_direction * speed
	
func _physics_process(delta: float) -> void:
	get_input()
	move_and_slide()
	update_animations()
	
func update_animations():
	if velocity == Vector2.ZERO:
		animated_sprite.play("idle")
	else:
		if abs(velocity.x) > abs(velocity.y):
			if velocity.x >0:
				animated_sprite.play("walk-right")
			else:
				animated_sprite.play("walk-left")
		else:
			if velocity.y>0:
				animated_sprite.play("walk-down")
			else:
				animated_sprite.play("walk-up")
				
