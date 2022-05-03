camera_set_view_pos(view_camera[0],camX,camY);
if(shake == true){
	shake_frames++;
	camX = choose(-shake_amount,shake_amount);
	if(shake_frames > shake_max_frames){
		shake_frames = 0;
		camX = 0;
		shake = false;
	}
}
x = camX;
y = camY;


if(room == rm_game){
	shake_amount = 3;
}
