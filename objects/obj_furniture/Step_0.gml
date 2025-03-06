/// Step Event (obj_Furniture)
if (mouse_check_button_pressed(mb_left) && position_meeting(mouse_x, mouse_y, id)) {
    // Pick up the object and allow dragging
    instance_create_layer(mouse_x, mouse_y, "Instances", obj_dragging).sprite_index = sprite_index;
    instance_destroy(); // Remove the current object
}