if scr_mouse_enter() {
	if mouse_check_button_pressed(mb_left) {
		if room == r_house {
			room_goto(r_backyard);
		} else {
			room_goto(r_house);
		}
	}
}