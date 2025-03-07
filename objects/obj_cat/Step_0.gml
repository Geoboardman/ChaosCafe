/// Step Event (obj_Cat)
scr_inputs_simple();

onground = place_meeting(x,y+1,obj_wall);

// Reduce timer
state_timer--;

//go to pickup state 
if scr_mouse_enter() {
	if left_click_held {
		state = CatState.PICKED_UP;
	}
}

//flip sprite based on hsp
if hsp != 0 { image_xscale = sign(hsp); }

//randomize state
if state != CatState.PICKED_UP and state != CatState.SLEEP_ON_BED {
	if (state_timer <= 0) {
	    var new_state = irandom(4);
		state = choose(
			CatState.IDLE,
			CatState.SIT,
			CatState.RUN,
			CatState.JUMP,
			CatState.JUMP,
			CatState.SLEEP,
		)
	    state_timer = irandom_range(60, 180);
	}
}

// Handle Movement
switch (state) {
    case CatState.IDLE: 
		sprite_index = sprite_set.idle; 
		hsp = 0; 
		break;
    case CatState.SIT:
		sprite_index = sprite_set.sit;
		hsp = 0;
		break;
    case CatState.RUN:
		sprite_index = sprite_set.run; 
		var _furniture = instance_place(x,y,obj_furniture);
		if _furniture != noone {
			if _furniture.sprite_index == spr_catbedblue {
				state = CatState.SLEEP_ON_BED;
				x = _furniture.x;
				y = _furniture.y-sprite_height/2;
			}
		}
        if (hsp == 0) hsp = choose(-2,-1,1,2);
        x += hsp * speed_walk;
		if place_meeting(x+hsp,y,obj_wall) { state = CatState.IDLE; }
        break;
    case CatState.JUMP:
		sprite_index = sprite_set.jump;
		image_index = vsp < 0? 0 : 1;
		if (hsp == 0) hsp = choose(-1,1);
		if onground {
			vsp = jump_force;
		}
        break;
    case CatState.SLEEP:
		sprite_index = sprite_set.sleep;
		hsp = 0;
		break;
    case CatState.SLEEP_ON_BED:
		sprite_index = sprite_set.sleep;
		hsp = 0; 
		break;
    case CatState.PICKED_UP:
		sprite_index = sprite_set.idle;
		hsp = 0; 
		x = mouse_x;
		y = mouse_y;
		grav = 0;
		if not left_click_held {
			state = CatState.JUMP;
			grav = MACRO_GRAV;
		}
		break;
}

//collision system
scr_collision_system();