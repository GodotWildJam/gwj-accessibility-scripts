class_name MuteButton
extends CheckBox

const AUDIO_CONFIG_SECTION = "Audio"
const MUTE_BUS_PREFIX = "%sMute"

@export var bus_name: StringName = "Master"

var _bus_index = 0

func _ready() -> void:
	_bus_index = AudioServer.get_bus_index(bus_name)
	var config_value = Config.get_config(AUDIO_CONFIG_SECTION, MUTE_BUS_PREFIX % bus_name, false)
	button_pressed = config_value
	_set_mute(config_value)
	if not toggled.is_connected(_on_toggled):
		toggled.connect(_on_toggled)

func _set_mute(muted: bool) -> void:
	AudioServer.set_bus_mute(_bus_index, muted)
	Config.set_config(AUDIO_CONFIG_SECTION, MUTE_BUS_PREFIX % bus_name, muted)

func _on_toggled(toggled_on):
	_set_mute(toggled_on) # Replace with function body.
