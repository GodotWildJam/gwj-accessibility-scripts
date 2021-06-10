extends Button

# Set this string to the name of the action in the InputMap
export(String) var action

var _editing = false


func _ready():
	_update_button_text(InputMap.get_action_list(action)[0])


func _input(input_event: InputEvent) -> void:
	if _editing and not input_event is InputEventMouseMotion:
		InputMap.action_erase_events(action)
		InputMap.action_add_event(action, input_event)
		
		_update_button_text(input_event)
		_editing = false
		pressed = false


func _update_button_text(input_event: InputEvent) -> void:
	if input_event is InputEventMouseButton:
			if input_event.button_index == BUTTON_LEFT:
				text = "Mouse Left"
			elif input_event.button_index == BUTTON_RIGHT:
				text = "Mouse Right"
			elif input_event.button_index == BUTTON_MIDDLE:
				text = "Mouse Middle"
	else:
		text = input_event.as_text()


func _on_Button_pressed() -> void:
	_editing = true
