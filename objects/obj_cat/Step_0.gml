/// Step Event (obj_Cat)

// Reduce timer
state_timer--;

if (state_timer <= 0) {
    var new_state = irandom(4);
    switch (new_state) {
        case 0: state = CatState.IDLE; break;
        case 1: state = CatState.SIT; break;
        case 2: state = CatState.RUN; break;
        case 3: state = CatState.JUMP; break;
        case 4: state = CatState.SLEEP; break;
    }
    state_timer = irandom_range(60, 180);
}

// Handle Movement
switch (state) {
    case CatState.IDLE: move_direction = 0; break;
    case CatState.SIT: move_direction = 0; break;
    case CatState.RUN:
        if (move_direction == 0) move_direction = choose(-1, 1);
        x += speed_run * move_direction;
        if (place_meeting(x + move_direction, y, obj_wall)) move_direction *= -1;
        break;
    case CatState.JUMP:
        if (place_meeting(x, y + 1, obj_ground)) y_velocity = jump_force;
        state = CatState.SIT;
        break;
    case CatState.SLEEP: move_direction = 0; break;
}

// Apply Gravity
y_velocity += gravity;
y += y_velocity;
if (place_meeting(x, y + 1, obj_ground)) y_velocity = 0;

// **Assign the sprite from the struct**
switch (state) {
    case CatState.IDLE: sprite_index = sprite_set.idle; break;
    case CatState.SIT: sprite_index = sprite_set.sit; break;
    case CatState.RUN: sprite_index = sprite_set.run; break;
    case CatState.JUMP: sprite_index = sprite_set.jump; break;
    case CatState.SLEEP: sprite_index = sprite_set.sleep; break;
}