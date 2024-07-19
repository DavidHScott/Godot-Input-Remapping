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
	if event.is_pressed():
		button_pressed = false
		grab_focus()
		update_text(event.as_text())
		set_process_unhandled_input(false)
	
	print(event)


func update_text(name:String):
	text = name
