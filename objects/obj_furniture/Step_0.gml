/// Step Event (obj_Furniture)

if scr_mouse_enter() { //if the cursor is over the furniture
	if mouse_check_button_pressed(mb_left) {
	    // Pick up the object and allow dragging
	    instance_create_layer(mouse_x, mouse_y, "Instances", obj_dragging).sprite_index = sprite_index;
	    instance_destroy(); // Remove the current object
	}

	if mouse_check_button_pressed(mb_right) {
		instance_destroy();
	}
}

switch sprite_index {
	case spr_catbedblue :
		break
}