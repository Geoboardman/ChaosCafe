//when time's up the character walks
walk_timer -= 1;

//flip sprite based on hsp
if hsp > 0 { image_xscale = 1; } else if hsp < 0 {image_xscale = -1; }

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
		if not instance_exists(obj_pet_parent) {
			state = "leave";
		}
		break;
	case "walk_forward":
		sprite_index = currect_sprites.walk_forward;
		vsp = 1;
		if place_meeting(x,y+1,obj_wall) {
			hsp = choose(-1,1);
			state = "walk_sideways";
		}
		break;
	case "walk_sideways":
		sprite_index = currect_sprites.walk_sideways;
		var _happy_pet = instance_place(x,y,obj_pet_parent);
		if _happy_pet != noone {
			if _happy_pet.happiness >= 100 and _happy_pet.onwer == noone {
				pet = _happy_pet;
				pet.state = "adopted";
				pet.onwer = self;
				pet.grav = 0;
				state = "adopting";
			}
		}
		if place_meeting(x+image_xscale,y,obj_wall) {
			state = "idle";
			walk_timer = og_walk_timer
		}
		if walk_timer <= 0 {
			hsp = 0;
			vsp = 0; 
			state = "idle";
			walk_timer = og_walk_timer
		}
		
		break;
	case "adopting":
		hsp = 0;
		if place_meeting(x,y,obj_exit) {
			vsp = -1;
			sprite_index = currect_sprites.walk_forward;
			x = obj_exit.x;
			if y <= room_height/3 {
				instance_destroy();
				instance_destroy(pet);
				global.money += 50;
			}
		} else {
			sprite_index = currect_sprites.walk_sideways;
			var _xdis = x - x;
			if _xdis < 0 {
				hsp = 1;
			} else {
				hsp = -1;
			}
		}
		break;
	case "leave":
		hsp = 0;
		if place_meeting(x,y,obj_exit) {
			vsp = -1;
			sprite_index = currect_sprites.walk_forward;
			x = obj_exit.x;
			if y <= room_height/3 {
				instance_destroy();
				instance_destroy(pet);
				global.money += 100;
			}
		} else {
			sprite_index = currect_sprites.walk_sideways;
			var _xdis = x - x;
			if _xdis < 0 {
				hsp = 1;
			} else {
				hsp = -1;
			}
		}
		break;
}


scr_collision_system();