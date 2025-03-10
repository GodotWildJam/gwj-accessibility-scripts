class_name RebindableActionButton
extends Button

const INPUT_CONFIG_SECTION = "Input"

# Set this string to the name of the action in the InputMap
@export var action: String

func _ready():
	var action_events = InputMap.action_get_events(action)
	if action_events.is_empty(): return
	var default_input = action_events[0]
	var config_value = Config.get_config(INPUT_CONFIG_SECTION, action, default_input)
	_update_button_text(config_value)
	if not toggled.is_connected(_on_toggled):
		toggled.connect(_on_toggled)

func _input(input_event: InputEvent) -> void:
	if button_pressed and not input_event is InputEventMouseMotion:
		if not input_event.is_pressed():
			set_pressed_no_signal(false)
			release_focus()
			InputMap.action_erase_events(action)
			InputMap.action_add_event(action, input_event)
			_update_button_text(input_event)
			Config.set_config(INPUT_CONFIG_SECTION, action, input_event)
			grab_focus()

func _update_button_text(input_event: InputEvent) -> void:
	if input_event is InputEventMouseButton:
		if input_event.button_index == MOUSE_BUTTON_LEFT:
			text = "Mouse Left"
		elif input_event.button_index == MOUSE_BUTTON_RIGHT:
			text = "Mouse Right"
		elif input_event.button_index == MOUSE_BUTTON_MIDDLE:
			text = "Mouse Middle"
	else:
		text = input_event.as_text()

func _on_toggled(button_pressed_state):
	if button_pressed_state:
		text = "press a key..."
