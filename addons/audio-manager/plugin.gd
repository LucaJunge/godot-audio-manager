tool
extends EditorPlugin


func _enter_tree() -> void:
	add_custom_type("AudioManager", "Node", preload("audio-manager.gd"), preload("audio-manager.png"))


func _exit_tree() -> void:
	remove_custom_type("AudioManager")
