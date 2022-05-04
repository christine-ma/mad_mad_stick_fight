if(player == obj_playerBlue){
	sprite_index = spr_particleBlue;
	if(direction_effect == -1){
		x -= moveSpeedX;
		y += moveSpeedY;
	}
	if(direction_effect == 1){
		x +=  moveSpeedX;
		y += moveSpeedY;
	}
}
if(player == obj_playerPink){
	sprite_index = spr_particlePink;
	if(direction_effect == -1){
		x -= moveSpeedX;
		y += moveSpeedY;
	}
	if(direction_effect == 1){
		x +=  moveSpeedX;
		y += moveSpeedY;
	}
}
