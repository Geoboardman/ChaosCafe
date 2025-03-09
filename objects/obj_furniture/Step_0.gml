/// Step Event (obj_Furniture)

if scr_mouse_enter() { //if the cursor is over the furniture
	if mouse_check_button(mb_left) {
		x = mouse_x;
		y = mouse_y;
	}

	if mouse_check_button_pressed(mb_right) {
		instance_destroy();
		global.money += price;
	}
} else {
	var _stuck = instance_place(x,y,obj_wall)
	if _stuck != noone {
		y = _stuck.bbox_top;
	}
}

switch sprite_index {
	case spr_catbedblue :
		var _pet = instance_place(x,y,obj_cat);
		if _pet != noone {
			if _pet.state == "sleep" {
				there_is_a_pet = true;
			}
		} else {
			there_is_a_pet = false;
		}
		break;
	case spr_litter_box:
		if scr_mouse_enter() { //if the cursor is over the furniture
			if mouse_check_button(mb_left) {
				if image_index == 1 and there_is_a_pet == false {
					image_index = 0;
				}
			}
		}
		var _pet = instance_place(x,y,obj_cat);
		if _pet != noone {
			if _pet.state == "poop" {
				there_is_a_pet = true;
			}
		} else {
			there_is_a_pet = false;
		}
		break;
}