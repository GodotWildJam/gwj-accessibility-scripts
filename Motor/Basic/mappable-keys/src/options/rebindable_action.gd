extends Button

# Set this string to the name of the action in the InputMap
export(String) var action


func _ready():
	_update_button_text(InputMap.get_action_list(action)[0])
	

func _input(input_event: InputEvent) -> void:
	if pressed and not input_event is InputEventMouseMotion:
		if not input_event.is_pressed():
			pressed = false
			release_focus()
			InputMap.action_erase_events(action)
			InputMap.action_add_event(action, input_event)
			_update_button_text(input_event)
			grab_focus()   


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


func _on_Button_toggled(button_pressed):
	if button_pressed:
		text = "press a key..."
