// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_inputs_simple(){
	
	//var stickh = gamepad_axis_value(0,gp_axislh);
	//var stickv = gamepad_axis_value(0,gp_axislv);
	
//directions
	right_pressed = keyboard_check_pressed(vk_right)or gamepad_button_check_pressed(0,gp_padr);
	right_held = keyboard_check(vk_right) or gamepad_button_check(0,gp_padr);
	right_released = keyboard_check_released(vk_right) or gamepad_button_check_released(0,gp_padr);
	
	left_pressed = keyboard_check_pressed(vk_left) or gamepad_button_check_pressed(0,gp_padl);
	left_held = keyboard_check(vk_left)	or gamepad_button_check(0,gp_padl);
	left_released = keyboard_check_released(vk_left) or gamepad_button_check_released(0,gp_padl);
	
	down_pressed = keyboard_check_pressed(vk_down) or gamepad_button_check_pressed(0,gp_padd);
	down_held = keyboard_check(vk_down)	or gamepad_button_check(0,gp_padd);
	down_released = keyboard_check_released(vk_down) or gamepad_button_check_released(0,gp_padd);
	
	up_pressed = keyboard_check_pressed(vk_up) or gamepad_button_check_pressed(0,gp_padu);
	up_held = keyboard_check(vk_up)	or gamepad_button_check(0,gp_padu);
	up_released = keyboard_check_released(vk_up) or gamepad_button_check_released(0,gp_padu);

//action buttons 																
	accept_input_pressed = keyboard_check_pressed(vk_space)	or keyboard_check_pressed(ord("Z"))	or gamepad_button_check_pressed(0,gp_face1);
	accept_input_held = keyboard_check(vk_space) or keyboard_check(ord("Z")) or gamepad_button_check(0,gp_face1);
	accept_input_released = keyboard_check_released(vk_space) or keyboard_check_released(ord("Z")) or gamepad_button_check_pressed(0,gp_face1);
	
	cancel_input_pressed = keyboard_check_pressed(ord("X")) or gamepad_button_check_pressed(0,gp_face2);
	cancel_input_held = keyboard_check(ord("X")) or gamepad_button_check(0,gp_face2);
	cancel_input_released = keyboard_check_released(ord("X")) or gamepad_button_check_pressed(0,gp_face2);

//mouse actions															
	left_click_pressed = mouse_check_button_pressed(mb_left);
	left_click_held = mouse_check_button(mb_left);
	left_click_released = mouse_check_button_released(mb_left);
	
	right_click_pressed = mouse_check_button_pressed(mb_right);
	right_click_held = mouse_check_button(mb_right);
	right_click_released = mouse_check_button_released(mb_right);
														  									 
//others												 		
	select = keyboard_check_pressed(vk_backspace) or gamepad_button_check_pressed(0,gp_select);
	start = keyboard_check_pressed(vk_enter) or gamepad_button_check_pressed(0,gp_start);

	r_key_pressed = keyboard_check_pressed(ord("R"));
	f_key_pressed = keyboard_check_pressed(ord("F"));

}