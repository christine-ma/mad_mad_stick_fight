
//combo time activates

if(fall_in){
	y += fallSpeed;
	x += moveX;
	if(y > global.stage_height){
		fall_in = false;
	}
}
else{
	x += moveX;
	y += moveY

	if(x<0){
		y = global.stage_height
		x = 0
		moveX *= -1;
	}
	if(x > room_width){
		x = room_width;
		moveX *= -1;
	}
	if(y<0){
		y = 0;
		moveY *= -1;
	}
	if(y > global.stage_height){
		moveY *= -1;
		
	}

}

