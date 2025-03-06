scr_inputs_simple();

if global.button_selected == row_id and global.column_selected == column_id { 
	global.button_selected=row_id;
	if accept_input_pressed or start or (left_click_pressed and hover==true) {
		alarm[0] = 8;
		//audio_play_sound(snd_shoot1,1,false);
		y += 2
	}
	text_color=c_lime;
} else {
	text_color=c_white;
}




