//when time's up the character walks
walk_timer -= 1;

//flip sprite based on hsp
if hsp != 0 { image_xscale = sign(hsp); }

switch (state) {
	case "idle":
		sprite_index = currect_sprites.indle;
		if walk_timer <= 0 {
			var _random_number = choose(1,1,2);
			if _random_number == 1 {
				hsp = choose(-1,1);
				state = "walk_sideways";
				walk_timer = og_walk_timer*6;
			} else {
				vsp = choose(-1,1);
				state = "walk_forward";
				walk_timer = og_walk_timer;
			}
		}
		break;
	case "walk_forward":
		sprite_index = currect_sprites.walk_forward;
		if walk_timer <= 0 {
			hsp = 0;
			state = "idle";
			walk_timer = og_walk_timer
		}
		break;
	case "walk_sideways":
		sprite_index = currect_sprites.walk_sideways;
		//if place_meeting(x,y,obj_door) {
		//	instance_destroy();
		//}
		if walk_timer <= 0 {
			hsp = 0;
			vsp = 0; 
			state = "idle";
			walk_timer = og_walk_timer
		}
		break;
}

scr_collision_system();