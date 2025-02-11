class_name SettingSlider
extends Slider


@export var config_section : StringName
@export var config_key: StringName
@export var feedback_sound_path: NodePath

var _feedback_sound: AudioStreamPlayer = null

func _ready() -> void:
	if not feedback_sound_path.is_empty():
		_feedback_sound = get_node(feedback_sound_path)
	if not Config.has_section_key(config_section, config_key):
		Config.set_config(config_section, config_key, value)
	var config_value = Config.get_config(config_section, config_key, 0.0)
	set_value_no_signal(config_value)
	if not value_changed.is_connected(_on_value_changed):
		value_changed.connect(_on_value_changed)

func _on_value_changed(new_value: float) -> void:
	Config.set_config(config_section, config_key, new_value)
	if _feedback_sound != null:
		if not _feedback_sound.is_playing():
			_feedback_sound.play()
