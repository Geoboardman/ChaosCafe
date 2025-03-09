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
			if room == r_house and instance_number(obj_human) < instance_number(obj_cat) {
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
		
		//TUTORIAL TEXT
		var _text_holder = collision_point(mouse_x,mouse_y,obj_parent_of_parents,false,false);
		if _text_holder != noone {
			if variable_instance_exists(_text_holder,"description_text") {
				global.tutorial_text = _text_holder.description_text;
			}
		} 
		
		//HAND
		var _pet = collision_point(mouse_x,mouse_y,obj_pet_parent,false,false);
		if _pet != noone {
			if _pet.state == "petting" {
				global.hand = true;
			} else {
				global.hand = false; 
			}
		} else {
			global.hand = false; 
		}
		
		if global.hand == true {
			cursor_sprite = spr_hand;
			window_set_cursor(cr_none);	
		} else {
			cursor_sprite = -1;
			window_set_cursor(cr_default);				
		}
		
		break;
}