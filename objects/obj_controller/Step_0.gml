scr_inputs_simple(); //Jampely's input script so you dont have to write so much.

if r_key_pressed {
	game_restart();
}


if room != r_menu { 
	global.game_state = "play";
}

switch (global.game_state) {
	case "menu":
		scr_create_menu( //jampley's menu script
			3,
			room_width/2,64,
			0,40,
			spr_button,
			[
				"START",
				"CREDITS",
				"QUIT",
			],
			[
				function() { room_goto_next(); instance_destroy(o_button); },
				function() { show_message("THIS DOES NOT THING YET"); },
				function() { game_end(); },
			]
		)
		break;
	case "play":
	
		//CAMERA SYSTEM
		global.camera_y_position = clamp(global.camera_y_position,0,room_height); 
		global.camera_x_position = clamp(global.camera_x_position,0,room_width-CAMERA_WIDTH);
		camera_set_view_pos(view_camera[0], global.camera_x_position, global.camera_y_position);
		
		//CUSTUMERS
		global.new_person_timer -= 1;
		if global.new_person_timer <= 0 {
			if room == r_house and instance_number(obj_human) < 10 {
				var _human = instance_create_layer(obj_exit.x,obj_exit.y,"humans",obj_human);
				global.money += 5;
				global.new_person_timer = og_new_person_timer;
				if timer_speed >= 10 {
					timer_speed += 1;
				}
			}
		}
		
		//MOUSE MOVEMENT
		if mouse_x != global.mouse_previous_x or mouse_y != global.mouse_previous_y {
			global.mouse_is_moving = true;
		} else {
			global.mouse_is_moving = false;
		}
		global.mouse_previous_x = mouse_x;
		global.mouse_previous_y = mouse_y;
		
		break;
}