//Jampley's script
function scr_create_menu(_column_legnth,_x,_y,_separetion_x,_separetion_y,_sprite,_option_names,_func_list) {
	var _button_list = [0]; //set array for the instances of the button object
	var _length = array_length(_option_names);//length of the array for the text assign to every instance
	var _button_amount = instance_number(o_button); //amount of instances of the button object
	if _button_amount < _length { //runs the for loop that assigns text, functions and IDs to the buttons
		if _button_amount = 0 {
			global.button_selected=0; //set the selected button to zero so the pointer is always next to the first button\
			global.column_selected=0; 
		}
		for (var i=0; i<_length; i+=1) {
			var b1 = instance_create_depth(_x,_y,-9999,o_button); //create an instance of the button
			b1.func=_func_list[i]; //assigns a funtion to it
			b1.text=_option_names[i]; //assigns a text to the instance
			if _sprite!=0 { //determines if the sprite should be invinsible
				b1.sprite_index=_sprite;
			} else {
				b1.image_alpha=0;
			}
			if i < _column_legnth {
				b1.y += b1.sprite_height+_separetion_y*i;
				b1.row_id=i; //assings an ID
			} else {
				b1.column_id = 1;
				b1.row_id=i-_column_legnth; //assings an ID
				b1.x += b1.sprite_width+_separetion_x;
				b1.y += b1.sprite_height+_separetion_y*(i-_column_legnth);
			}
		}
	} else {
		if global.volume_mode == false {
			if down_pressed and global.button_selected<_column_legnth-1 {
				global.button_selected+=1;
				//audio_play_sound(snd_select_option,1,false,1.4);
			} else if down_pressed {
				global.button_selected=0;
				//audio_play_sound(snd_select_option,1,false,1.4);
			}
			if up_pressed and global.button_selected>0 {
				global.button_selected-=1;
				//audio_play_sound(snd_select_option,1,false,1.4);
			} else if up_pressed {
				global.button_selected=_column_legnth-1;
				//audio_play_sound(snd_select_option,1,false,1.4);
			}
			if _button_amount > _column_legnth {
				if right_pressed and global.column_selected == 0 {
					global.column_selected = 1;
				} else if left_pressed and global.column_selected == 1 {
					global.column_selected = 0;
				}
			}
		} 
		
		for (var i=0; i<_button_amount; i+=1) {
			with (o_button) {
				if column_id = 0 {
					if row_id = i {
						text=_option_names[i];
					}
				} else {
					if row_id = i-_column_legnth {
						text=_option_names[i];
					}
				}
			}
		}
	}
}


