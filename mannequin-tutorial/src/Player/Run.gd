extends PlayerState

func unhandled_input(event):
    _parent.unhandled_input(event)

func physics_process(delta):
    _parent.physics_process(delta)
    
    if _parent.velocity.length() < 0.01:
        _state_machine.transition_to("Move/Idle")

func enter(msg: = {}) -> void:
    skin.transition_to(skin.States.RUN)
    _parent.enter()

func exit() -> void:
    _parent.exit()
