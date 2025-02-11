class_name VolumeSlider
extends Slider

const AUDIO_CONFIG_SECTION = "Audio"

@export var bus_name: StringName = "Master"
# This path can link to an AudioStreamPlayer node to play after the volume has changed. 
# For a music volume slider it should not be used (music should be playing while in the menu), 
# but for a sounds volume slider it helps the user adjust to the right volume. 
@export var feedback_sound_path: NodePath

var _feedback_sound: AudioStreamPlayer = null
var _original_bus_volume : float = 1.0

var _bus_index = 0

func _ready() -> void:
	if not feedback_sound_path.is_empty():
		_feedback_sound = get_node(feedback_sound_path)
	_bus_index = AudioServer.get_bus_index(bus_name)
	_original_bus_volume = db_to_linear(AudioServer.get_bus_volume_db(_bus_index))
	var config_value = Config.get_config(AUDIO_CONFIG_SECTION, bus_name, 1.0)
	set_value_no_signal(config_value)
	_set_volume(config_value)
	if not value_changed.is_connected(_on_value_changed):
		value_changed.connect(_on_value_changed)

func _set_volume(volume_linear: float) -> void:
	AudioServer.set_bus_volume_db(_bus_index, linear_to_db(volume_linear * _original_bus_volume))
	Config.set_config(AUDIO_CONFIG_SECTION, bus_name, volume_linear)

func _on_value_changed(new_value: float) -> void:
	_set_volume(new_value)
	if _feedback_sound != null:
		if not _feedback_sound.is_playing():
			_feedback_sound.play()
