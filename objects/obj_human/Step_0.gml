walk_timer -= 1;

switch (state) {
	case "idle":
		if walk_timer <= 0 {
			hsp = choose(-1,1);
			state = "walk";
			walk_timer = og_walk_timer*2
		}
		break;
	case "walk":
		if walk_timer <= 0 {
			hsp = 0;
			state = "idle";
			walk_timer = og_walk_timer
		}
		break;
}

scr_collision_system();