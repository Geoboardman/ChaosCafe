/// Create Event (obj_Cat)
enum CatState {
    IDLE,    
    WALK,    
    RUN,     
    JUMP,    
    SLEEP    
}

state = CatState.IDLE; // Start in IDLE
speed_walk = 1;
speed_run = 2;
jump_force = -6;
gravity = 0.3;
y_velocity = 0; 
move_direction = 0;
state_timer = irandom_range(60, 180); // Time before switching states (1-3 sec)

// Choose a random cat appearance
var cat_variant = irandom(2); // Adjust this based on the number of cats

// Store sprite sets in a ds_map
sprite_set = ds_map_create();

switch (cat_variant) {
    case 0:
        sprite_set[@ "idle"] = spr_Cat1_Idle;
        sprite_set[@ "walk"] = spr_Cat1_Walk;
        sprite_set[@ "run"] = spr_Cat1_Run;
        sprite_set[@ "jump"] = spr_Cat1_Jump;
        sprite_set[@ "sleep"] = spr_Cat1_Sleep;
        break;
    
    case 1:
        sprite_set[@ "idle"] = spr_Cat2_Idle;
        sprite_set[@ "walk"] = spr_Cat2_Walk;
        sprite_set[@ "run"] = spr_Cat2_Run;
        sprite_set[@ "jump"] = spr_Cat2_Jump;
        sprite_set[@ "sleep"] = spr_Cat2_Sleep;
        break;

    case 2:
        sprite_set[@ "idle"] = spr_Cat3_Idle;
        sprite_set[@ "walk"] = spr_Cat3_Walk;
        sprite_set[@ "run"] = spr_Cat3_Run;
        sprite_set[@ "jump"] = spr_Cat3_Jump;
        sprite_set[@ "sleep"] = spr_Cat3_Sleep;
        break;
}