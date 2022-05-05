if(game_next_room == true){
	if(room == rm_start){
		//move camera down
		obj_view_manager.camY+= 10+game_next_frames*2;
	}
	if(game_next_frames > game_next_frames_max){
		obj_view_manager.camX = 0;
		obj_view_manager.camY = 50;
		room_goto(rm_game);
	}
	game_next_frames++;
}
else{
	if (mouse_check_button_pressed(mb_left)&& position_meeting(mouse_x, mouse_y,self)){
		y = start_y+4;
	}
	if (mouse_check_button_released(mb_left) && position_meeting(mouse_x, mouse_y,self)){
		y = start_y;
		//Play sound here of bell ring
		audio_play_sound(boxingBell, 10, false);
		
		game_next_room = true;
	}
}

if(move_frames > move_max_frames){
	move_frames = 0;
	if(up == true){
		up = false;
	}
	else if(up == false){
		up = true;
	}
}
move_frames++;

if(up == true){
	y-=.5;
}
else if(up == false){
	y+=.5;
}

