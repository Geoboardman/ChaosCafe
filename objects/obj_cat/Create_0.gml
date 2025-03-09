// movement 
	hsp = 0;
	vsp = 0;
	grav = MACRO_GRAV;
	speed_walk = 1;
	speed_run = 2;
	jump_force = -5;
	onground = 0;
	onwall = 0;
	
//State 
	state_timer = irandom_range(60, 180); // Time before switching states (1-3 sec)
	state = "idle"; // Start in IDLE
	function randomize_state(){
		if (state_timer <= 0) {
		    var new_state = irandom(4);
			state = choose(
				"idle",
				"sit",
				"run",
				"jump",
			)
		    state_timer = irandom_range(60, 180);
		}
		grav = MACRO_GRAV;
	}
	
	//sleeping
	sleepy = true;
	og_sleep_timer = 600;
	sleep_timer = og_sleep_timer;
	
	//pooping
	poop = true;
	og_poop_timer = 300;
	poop_timer = og_poop_timer;
	
	//petting
	petting = true;
	can_be_pet = 0;
	og_petting_timer = 120;
	petting_timer = og_petting_timer;
	
	
//ADOPTION
	happiness = 0;
	happiness_frame = 0;
	onwer = noone;
	
//Sprite structs
cat_sprites_1 = {
    idle: spr_IdleCatb,
    sit: spr_Sittingb,
    run: spr_RunCatb,
    jump: spr_JumpCabt,
    sleep: spr_SleepCatb
};

cat_sprites_2 = {
    idle: spr_IdleCattt,
    sit: spr_Sittinggg,
    run: spr_RunCattt,
    jump: spr_JumpCatttt,
    sleep: spr_SleepCattt
};

// Create a struct with sprite sets for different actions
sprite_set = choose(
	cat_sprites_1,
	cat_sprites_2,
)

function stop_movement() {
	hsp = 0;
	vsp = 0;
	grav = 0;
}

