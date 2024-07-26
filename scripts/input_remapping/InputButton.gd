extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	set_process_unhandled_input(false)


func _toggled(button_pressed):
	set_process_unhandled_input(button_pressed);
	if(button_pressed):
		text = "..."
		release_focus()
	else:
		grab_focus()
	


func _unhandled_input(event):
	if event is InputEventKey:
		
		update_text(OS.get_keycode_string(event.get_key_label_with_modifiers()))
		
		
		if event.is_pressed():
			
			# If the key is a normal key, stop listening. If it is a modifier, keep listening
			if(event.get_keycode() != KEY_SHIFT and event.get_keycode() != KEY_CTRL and event.get_keycode() != KEY_ALT):
				button_pressed = false
				grab_focus()
				set_process_unhandled_input(false)
				
				return
		elif event.is_released():
			# This will always mean that a modifier was released, because if a normal key was pressed at all, then it would be returned above
			pass
		


func confirm_new_input():
	pass


func update_text(name:String):
	text = name
