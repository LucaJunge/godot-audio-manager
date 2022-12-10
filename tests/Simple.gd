extends Node

var test_stream = preload("res://tests/simple.wav")
var test_path = "res://tests/simple.wav"
var audio_manager = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	audio_manager = get_node("AudioManager")
	print(audio_manager)

	audio_manager.play(test_path, 1.0)

	#audio_manager.play(test_stream, 1.0)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
