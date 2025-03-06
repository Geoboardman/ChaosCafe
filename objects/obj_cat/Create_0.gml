/// Create Event (obj_Cat)
enum CatState {
    IDLE,    
    SIT,    
    RUN,     
    JUMP,    
    SLEEP    
}

state = CatState.IDLE; // Start in IDLE

// movement 
hsp = 0;
vsp = 0;
grav = 0.3;
speed_walk = 1;
speed_run = 2;
jump_force = -6;

y_velocity = 0; 
move_direction = 0;
state_timer = irandom_range(60, 180); // Time before switching states (1-3 sec)

// Randomly assign a cat type (0, 1, or 2)
cat_variant = irandom(2);

// Create a struct with sprite sets for different actions
sprite_set = new_cat_sprites(cat_variant);

//image_speed = 0.25;


