extends HSlider

export(String) var bus_name = "Master"
# This path can link to an AudioStreamPlayer node to play after the volume has changed. 
# For a music volume slider it should not be used (music should be playing while in the menu), 
# but for a sounds volume slider it helps the user adjust to the right volume. 
export(NodePath) var feedback_sound_path = null

var _feedback_sound: AudioStreamPlayer = null

var _bus_index = 0

func _ready() -> void:
	if feedback_sound_path != null:
		_feedback_sound = get_node(feedback_sound_path)
	_bus_index = AudioServer.get_bus_index(bus_name)
	_set_volume(value)


func _set_volume(value: float) -> void:
	AudioServer.set_bus_volume_db(_bus_index, linear2db(value))


func _on_VolumeSlider_value_changed(value: float) -> void:
	_set_volume(value)
	if _feedback_sound != null:
		if not _feedback_sound.is_playing():
			_feedback_sound.play()

