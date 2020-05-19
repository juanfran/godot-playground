extends PlayerState

export var max_speed: = 5.0
export var move_speed: = 5.0
export var gravity: = -80.0
export var jump_impulse: = 25.0

var velocity: = Vector3.ZERO

func physics_process(delta: float) -> void:
    var input_direction: = get_input_direction()
    
    var move_direction: = input_direction
    
    if move_direction.length() > 1.0:
        move_direction = move_direction.normalized()
        
    move_direction.y = 0.0
    
    if move_direction:
        player.look_at(player.global_transform.origin + move_direction, Vector3.UP)
    
    velocity = calculate_velocity(velocity, move_direction)
    velocity = player.move_and_slide(velocity, Vector3.UP)
    
static func get_input_direction() -> Vector3:
    return Vector3(
            Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
            0.0,
            Input.get_action_strength("move_back") - Input.get_action_strength("move_front")
       )

func calculate_velocity(velocity_current: Vector3, move_direction: Vector3) -> Vector3:
    var velocity_new: = velocity_current
    velocity_new = move_direction * move_speed
    
    if velocity_new.length() > max_speed:
        velocity_new = velocity_new.normalized() * max_speed
        
    velocity_new.y = velocity_current.y + gravity
    
    return velocity_new
