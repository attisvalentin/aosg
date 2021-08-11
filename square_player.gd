extends KinematicBody2D

signal hide_and_show

export var speed = 300
export var gravity = 8
export var jump_height = -400
const UP = Vector2(0, -1)
var movement = Vector2()
var snap = Vector2(0, 32)

func _physics_process(delta):
	movement.y += gravity
	if Input.is_action_pressed("ui_right"):
		movement.x = speed
		$AnimatedSprite.scale.x = 1
	elif Input.is_action_pressed("ui_left"):
		movement.x = -speed
		$AnimatedSprite.scale.x = -1
	else:
		movement.x = 0
	
	if Input.is_action_just_pressed("SPIN") and movement.x != 0:
		dash()
		$dash_waiting.start()
	
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			$jump.play()
			movement.y = jump_height
			snap = Vector2(0, -1)
		else: 
			snap = Vector2(0, 32)
		if movement.x > 0:
			$AnimatedSprite.play("idle")
		elif movement.x < 0:
			$AnimatedSprite.play("idle")
		else:
			$AnimatedSprite.play("idle")
			
	
	movement = move_and_slide_with_snap(movement, snap, UP)


func dash():
	speed = 800
	$dash.play()
	$AnimatedSprite.play('spin')
	$AnimationPlayer.play("spin")
	$dash_waiting.start()
	

func _on_dash_waiting_timeout():
	speed = 300

func _on_canvas_game_over():
	queue_free()


func _on_spikes_body_entered(body):
	queue_free()
	emit_signal("hide_and_show")
	


func _on_shuriken_body_entered(body):
	queue_free()
	emit_signal("hide_and_show")
