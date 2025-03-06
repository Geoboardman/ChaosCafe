/// Step Event (obj_Cat)

// Reduce timer
state_timer--;

if hsp != 0 { image_xscale = sign(hsp); }

if (state_timer <= 0) {
    var new_state = irandom(4);
    switch (new_state) {
        case 0: state = CatState.IDLE; break;
        case 1: state = CatState.SIT; break;
        case 2: state = CatState.RUN; break;
        case 3: state = CatState.JUMP; break;
        case 4: state = CatState.SLEEP; break;
        case 5: state = CatState.SLEEP_ON_BED; break;
    }
    state_timer = irandom_range(60, 180);
}

// Handle Movement
switch (state) {
    case CatState.IDLE: 
		hsp = 0; 
		
		break;
    case CatState.SIT:
	
		hsp = 0;
		break;
    case CatState.RUN:
		var _furniture = instance_place(x,y,obj_furniture);
		if _furniture != noone {
			if _furniture.sprite_index == spr_catbedblue {
				state = CatState.SLEEP_ON_BED;
				x = _furniture.x;
				y = _furniture.y-sprite_height/2;
			}
		}
        if (hsp == 0) hsp = choose(-2, 1);
        x += hsp * speed_walk;
		if place_meeting(x+hsp,y,obj_wall) { state = CatState.IDLE; }
        break;
    case CatState.JUMP:
        if (place_meeting(x, y + 1, obj_ground)) y_velocity = jump_force;
        state = CatState.SIT;
		
        break;
    case CatState.SLEEP:
		hsp = 0;
		
		break;
    case CatState.SLEEP_ON_BED:
		hsp = 0; 
		
		break;
}

// **Assign the sprite from the struct**
switch (state) {
    case CatState.IDLE: sprite_index = sprite_set.idle; break;
    case CatState.SIT: sprite_index = sprite_set.sit; break;
    case CatState.RUN: sprite_index = sprite_set.run; break;
    case CatState.JUMP: sprite_index = sprite_set.jump; break;
    case CatState.SLEEP: sprite_index = sprite_set.sleep; break;
}

scr_collision_system();