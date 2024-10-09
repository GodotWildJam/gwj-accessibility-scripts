extends CheckBox


@export var bus_name: String = "Master"

var _bus_index = 0

func _ready() -> void:
	_bus_index = AudioServer.get_bus_index(bus_name)
	_set_mute(false)

func _set_mute(value: bool) -> void:
	AudioServer.set_bus_mute(_bus_index, value)

func _on_toggled(toggled_on):
	_set_mute(toggled_on) # Replace with function body.
