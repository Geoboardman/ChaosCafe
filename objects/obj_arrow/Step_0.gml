scr_inputs_simple();


if image_index == 0 {
	x = global.camera_x_position;
	y = global.camera_y_position;
	if left_click_held and hover == true {
		global.camera_x_position -= scroll_speed;
	}
} else {
	x = global.camera_x_position+CAMERA_WIDTH-32;
	y = global.camera_y_position;
	if left_click_held and hover == true {
		global.camera_x_position += scroll_speed;
	}
}

