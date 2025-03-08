if scr_mouse_enter() {
	if mouse_check_button_pressed(mb_left) {
		room_goto(room_id);
		if room_side == 1 {
			global.camera_x_position = 0;
		} else {
			global.camera_x_position = room_width-CAMERA_WIDTH;
		}
	}
}