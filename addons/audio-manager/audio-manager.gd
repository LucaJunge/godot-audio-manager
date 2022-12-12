tool
extends Node

# should be a dictionary with id, name and path
export (Array, Resource) var sound_files

# SIGNALS#
signal played
signal stopped
signal played_loop

### PROPERTIES IN INSPECTOR ###

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	create_default_player()
	# preload all sound files
	pass # Replace with function body.

func create_default_player() -> void:
	var player = AudioStreamPlayer.new()
	player.name = "default_player"
	self.add_child(player)

# Plays a Sound once
func play(source, volume: float = 1.0) -> AudioStreamPlayer:
	
	var audio_stream = null
	
	# If the source is a string, create an AudioStream first
	if typeof(source) == TYPE_STRING:
		audio_stream = load(source)
	else:
		audio_stream = source
	
	# Create a new AudioStreamPlayer
	var player: AudioStreamPlayer = create_player(audio_stream, volume)
	
	# Destroy the AudioStreamPlayer if the sound has finished playing
	player.connect("finished", player, "queue_free")
	
	# Add the player to the AudioManager
	self.add_child(player)
	
	player.play()
	
	return player

func play_loop(source, volume: float = 1.0) -> AudioStreamPlayer:
	
	var audio_stream = null
	
	# If the source is a string, create an AudioStream first
	if typeof(source) == TYPE_STRING:
		audio_stream = load(source)
	else:
		audio_stream = source
	
	# Create a new AudioStreamPlayer
	var player: AudioStreamPlayer = create_player(audio_stream, volume)
	
	# Loop the sound
	player.stream.loop_mode = AudioStreamSample.LOOP_FORWARD
	
	# Add the player to the AudioManager
	self.add_child(player)
	
	player.play()
	
	return player
	
func create_player(stream: AudioStream, volume: float = 1.0) -> AudioStreamPlayer:
	var player: AudioStreamPlayer = AudioStreamPlayer.new()
	player.bus = "Master"
	player.stream = stream
	player.volume_db = volume
	return player
	
