
//stopping previous sounds
audio_stop_sound(backgroundMusic);
audio_stop_sound(crowdFighting);

if(global.winner == "blue"){
	sprite_index = spr_BlueWinsEndscreen;
	audio_play_sound(crowdCheer, 10, false);
}
else{
	sprite_index = spr_PinkWinsEndscreen;
	audio_play_sound(crowdCheer, 10, false);
}
