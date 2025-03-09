/// Step Event (obj_Cat)
scr_inputs_simple();

//happiness += 1;

onground = place_meeting(x,y+1,obj_wall);
onwall = place_meeting(x+image_xscale,y,obj_wall);

//if place_meeting(x,y,obj_wall) x += -image_xscale

// Reduce timer
state_timer--;

//go to pickup state 
if scr_mouse_enter() and state != "adopted" {
	if petting == true {
		if global.mouse_is_moving == true and can_be_pet < 30 {
			can_be_pet += 2;
			if can_be_pet >= 20 {
				state = "petting";
			}
		} else if can_be_pet > 0 {
			can_be_pet -= 1;
		}
	}
	if left_click_held {
		state = "picked_up";
	}
}

//flip sprite based on hsp
if hsp != 0 and not onwall { image_xscale = sign(hsp); }


if sleepy == false {
	sleep_timer -= 1;
	if sleep_timer < 0 {
		sleep_timer = og_sleep_timer;
		sleepy = true;
	}
}

if poop == false {
	poop_timer -= 1;
	if poop_timer < 0 {
		poop_timer = og_poop_timer;
		poop = true;
	}
}

if petting == false {
	petting_timer -= 1;
	if petting_timer < 0 {
		petting_timer = og_petting_timer;
		petting = true;
	}
}

// STATE MACHINE
switch (state) {
    case "idle": 
		sprite_index = sprite_set.idle; 
		randomize_state();
		hsp = 0; 
		break;
    case "sit":
		sprite_index = sprite_set.sit;
		randomize_state();
		hsp = 0;
		break;
    case "run":
		sprite_index = sprite_set.run; 
		randomize_state();
		var _furniture = instance_place(x,y,obj_furniture);
		if _furniture != noone {
			switch (_furniture.sprite_index) {
				case spr_catbedblue:
					if sleepy == true and _furniture.there_is_a_pet == false {
						x = _furniture.x;
						y = _furniture.y-sprite_height/2;
						sleepy = false;
						state = "sleep"
					}
					break;
				case spr_litter_box:
					if poop == true and _furniture.there_is_a_pet == false and _furniture.image_index = 0 {
						x = _furniture.x;
						y = _furniture.y-sprite_height/2;
						poop = false;
						state = "poop"
					}
					break;
			}

		}
        if (hsp == 0) hsp = choose(-2,-1,1,2);
        x += hsp * speed_walk;
		if place_meeting(x+hsp,y,obj_wall) {state = "idle"; }
        break;
    case "jump":
		sprite_index = sprite_set.jump;
		randomize_state();
		image_index = vsp < 0? 0 : 1;
		if (hsp == 0) hsp = choose(-1,1);
		if onground and vsp == 0 { vsp = choose(-5,-6); } 
		if place_meeting(x,y+1,obj_wall) and vsp > 0 { state = "run"; }
        break;
    case "sleep":
		sprite_index = sprite_set.sleep;
		stop_movement();
		sleep_timer -= 1;
		if not place_meeting(x,y,obj_furniture) or sleep_timer <= 0 {
			state_timer = irandom_range(60, 180);
			sleep_timer = og_sleep_timer
			happiness += 25;
			state = "run";
		}
		break;
    case "poop":
		sprite_index = sprite_set.sit;
		stop_movement();
		poop_timer -= 1;
		if not place_meeting(x,y,obj_furniture) or poop_timer <= 0 {
			if poop_timer <= 0 {
				var _furniture = instance_place(x,y,obj_furniture);
				if _furniture != noone {
					_furniture.image_index = 1;
				}
			}
			poop_timer = og_poop_timer
			state_timer = irandom_range(60, 180);
			happiness += 50;
			state = "run";
		}
		break;
    case "petting":
		sprite_index = sprite_set.sit;
		hsp = 0;
		grav = MACRO_GRAV;
		petting_timer -= 1;
		if scr_mouse_enter() {
			if global.mouse_is_moving == true {
				happiness += 0.2;
			}
		}
		if petting_timer <= 0 {
			if petting_timer <= 0 {
				var _furniture = instance_place(x,y,obj_furniture);
				if _furniture != noone {
					_furniture.image_index = 1;
				}
			}
			petting_timer = og_petting_timer*4;
			state_timer = irandom_range(60, 180);
			petting = false;
			state = "run";
		}
		break;
    case "picked_up":
		sprite_index = sprite_set.idle;
		stop_movement();
		x = mouse_x;
		y = mouse_y;
		if not left_click_held {
			if place_meeting(x,y,obj_furniture) {
				state = "run";
			} else {
				state = "jump";
			}
		}
		break;
    case "adopted":
		sprite_index = sprite_set.idle;
		stop_movement();
		x = onwer.x;
		y = onwer.y;
		break;
}

//collision system
scr_collision_system();