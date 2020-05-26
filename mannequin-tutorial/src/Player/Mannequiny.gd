extends Spatial

class_name Mannequiny

enum States {IDLE, RUN, AIR}

onready var animation_tree: AnimationTree = $AnimationTree
onready var _playback: AnimationNodeStateMachinePlayback = animation_tree["parameters/playback"]

func _ready() -> void:
    animation_tree.active = true

func transition_to(state_id: int) -> void:
    match state_id:
        States.IDLE:
            _playback.travel("idle")
        States.RUN:
            _playback.travel("run")
        _:
            _playback.travel("idle")
