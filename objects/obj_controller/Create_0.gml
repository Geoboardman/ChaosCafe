#macro DEBUG_MODE true
skip_room = r_house;

if DEBUG_MODE == true {
	if skip_room != undefined {
		room_goto(skip_room);
	}
}


//GLOBAL VARIABLES
	global.game_state = "menu";
	
	global.camera_x_position = 0;
	global.camera_y_position = 0;
	
	global.volume_mode = false;  // this variable current does nothing
	
	global.money = 50;
	current_money_amount = global.money;
	
	og_new_person_timer = 1500;
	global.new_person_timer = 300;
	timer_speed = 1;
	
	global.tutorial_text = undefined;
	
	global.mouse_previous_x = mouse_x;
	global.mouse_previous_y = mouse_y;
	global.mouse_is_moving = false; 
	
	global.hand = false;
	
//MACROS
	#macro GUI_WIDTH 448
	#macro GUI_HEIGHT 264
	#macro CAMERA_WIDTH 448
	#macro CAMERA_HEIGHT 264
	#macro MACRO_GRAV 0.3
	
//EMUMS
	enum CatState {
	    IDLE,    
	    SIT,    
	    RUN,     
	    JUMP,    
	    SLEEP,    
	    SLEEP_ON_BED,
	    PICKED_UP,
	    ADOPTED,
	    POOP,
	}
	
//FUNCTIONS
	function reset_timer() {
		global.new_person_timer = og_new_person_timer;
	}
	
//OTHERS
	display_set_gui_size(GUI_WIDTH,GUI_HEIGHT);