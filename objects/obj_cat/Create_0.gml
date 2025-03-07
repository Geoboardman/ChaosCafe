state = CatState.IDLE; // Start in IDLE

// movement 
hsp = 0;
vsp = 0;
grav = MACRO_GRAV;
speed_walk = 1;
speed_run = 2;
jump_force = -5;
onground = 0;
onwall = 0;

state_timer = irandom_range(60, 180); // Time before switching states (1-3 sec)

// Randomly assign a cat type (0, 1, or 2)
cat_variant = irandom(2);

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



