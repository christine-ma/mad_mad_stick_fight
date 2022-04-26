

if(fall_in){
	y += fallSpeed;
	if(y > stage_height){
		fall_in = false;
	}
}
else{
	x += moveX;
	y += moveY

	if(x<0)or(x>room_width){
		moveX *= -1;
	}
	if(y<0)or(y>stage_height){
		moveY *= -1;
	}

}

