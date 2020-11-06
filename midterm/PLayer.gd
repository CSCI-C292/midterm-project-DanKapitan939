extends KinematicBody2D

var velocity = Vector2(0,0)
const SPEED = 180
const GRAV = 30
const JUMP = -900

func _physics_process(delta):
	if Input.is_action_pressed("right"):
		velocity.x = 200
		$AnimatedSprite.play("walking")
		$AnimatedSprite.flip_h = false
	elif Input.is_action_pressed("left"):
		velocity.x = -200
		$AnimatedSprite.play("walking")
		$AnimatedSprite.flip_h = true
	else:
		$AnimatedSprite.play("idle")
	if not is_on_floor():
		$AnimatedSprite.play("jump")
	velocity.y = velocity.y + GRAV
	
	if Input.is_action_just_pressed("up") and is_on_floor():
		velocity.y = JUMP
		
	
	move_and_slide(velocity,Vector2.UP)
	
	velocity.x = lerp(velocity.x,0,0.1)



