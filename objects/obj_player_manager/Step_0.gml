


move_left = keyboard_check(left_key);
move_right = keyboard_check(right_key);
jump = keyboard_check(jump_key);
attack = keyboard_check_pressed(attack_key);

//Stop user input movement
if(stop_movement == true){
	if(is_hit){

		cooldown = true;
		//the hit player moves the opposite direction of the opponent when hit
		if(opponent.image_xscale == -1){
			x -= 1.8*stop_frames;
		}
		else if (opponent.image_xscale == 1){
			x += 1.8*stop_frames;
		}
	}

	jump = noone;
	move_left = noone;
	move_right = noone;
	attack = noone;
	
	if(stop_frames > stop_max_frames){
		//Game over
		if(global.winner != noone){
			//Game over
			room_goto(rm_end);
		}
		stop_movement = false;
		stop_frames = 0;
		opponent.is_hit=false;
		instance_destroy(obj_attack_collision);
		instance_destroy(obj_particle);

	}
	stop_frames++;
	
}
if(cooldown==true){
	cooldown_frames++;
	if(cooldown_frames>cooldown_max_frames){
		cooldown_frames = 0;
		cooldown = false;
	}
}
//slow the player down a little every frame (helps to make it easier to control)
current_x_velocity *= 0.9;
//gravity accelerates the player down.
current_y_velocity += grav;

//Change to jumping in air 
if(jump and is_on_ground == true){
	current_y_velocity = bounce_velocity;
	is_on_ground = false;
	sprite_index = jump_sprite;
	//Add jump sound here if you like
	audio_play_sound(jumping, 10, false);
}

if(is_on_ground){
		move_speed = 5;
		if(sprite_index != attack_sprite){
			sprite_index = idle_sprite;
		}
		if(is_hit){
			sprite_index = knockback_sprite
		}
		if(move_left){
			image_xscale = -1	
			x -= move_speed + acceleration_frames + deceleration_frames;
		}
		if(move_right){
			image_xscale = 1	
			x += move_speed + acceleration_frames + deceleration_frames;
		}
		if(ground_acceleration == true){
			acceleration_frames++;
		}
		else{
			//deccelerate
			deceleration_frames++;
		}
		if(acceleration_frames > acceleration_max_frames){
			acceleration_frames = 0;
			ground_acceleration = false;
		}
		if(deceleration_frames > deceleration_max_frames){
			deceleration_frames = 0;
			ground_acceleration = true;
		}
}
else{
	jump_state();
}

//Player Attacks
//opponent_collision = place_meeting(x,y,opponent);
opponent_collision = collision_rectangle(x-75, y-30, x+75, y+30, opponent,false, true);
if(attack){
		
	sprite_index = attack_sprite;
		
	if(opponent_collision and opponent.is_hit==false and opponent.cooldown == false){
		//Play sound here: Opponent is hit - Should only play once
		audio_play_sound(punching, 10, false);
		
		//Do particle effect
		for(p = 0; p<10;p++){
			particle = instance_create_layer(opponent.x,opponent.y+30,"objects",obj_particle)
			if(opponent == obj_playerBlue){
				particle.player = obj_playerBlue;
				if(image_xscale == 1){
					particle.direction_effect = 1;
				
				}
				if(image_xscale == -1){
					particle.direction_effect = -1;
				}
			}
			if(opponent == obj_playerPink){
				particle.player = obj_playerPink;
				if(image_xscale == 1){
					particle.direction_effect = 1;
				
				}
				if(image_xscale == -1){
					particle.direction_effect = -1;
				}
			}
		}
		
		opponent.current_health--;
			
			
		//Player Stage Boundaries
		if(opponent.x > room_width-offset_boundary+10){
			opponent.x = room_width-offset_boundary;
		}
		if(opponent.x < offset_boundary-10){
			opponent.x = offset_boundary;
		}
		if(image_xscale == opponent.image_xscale){
			opponent.image_xscale *= -1;
		}

		//Set the opponent is hit to true to avoid multiple collision checks
		opponent.is_hit = true;
		attack_collision = instance_create_layer(opponent.x,opponent.y+30,"objects",obj_attack_collision);
		attack_collision.depth = opponent.depth-10;
		attack_collision.player = opponent;
			
		obj_view_manager.shake = true;
		stop_movement = true;
		opponent.stop_movement = true;
	}
}
	
	
//Change player depth
if(opponent_collision and (move_left or move_right)){
	depth = opponent.depth-5;
}

	
combo_collision = collision_rectangle(x-10,y-10,x+10,y+10,obj_combo_activator,false,true)
if(combo_collision){
	combo = true;
	//Possible set stop movement to true
	obj_combo_manager.combo_activated = true;
}


if(combo == true){ 
	//Decrease opponent attack
	//Show animation
	if(obj_combo_manager.combo_activated_frames > obj_combo_manager.combo_activated_max_frames){
		combo = false;
		obj_combo_manager.combo_activated_frames = 0;
		obj_combo_manager.combo_activated = false;
	}
	obj_combo_manager.combo_activated_frames++
}

if(current_health == 0){
	if(opponent == obj_playerBlue){
		global.winner = "blue"
	}
	else{
		global.winner = "pink"
	}//blue player or pink player
	//Game will wait a few frames before going to end screen
	

}

offset_boundary = 125;
//Player Stage Boundaries
if(x > room_width-offset_boundary){
	x = room_width-offset_boundary;
}
if(x < offset_boundary){
	x = offset_boundary;
}

function jump_state(){
		
		if(move_left){
			image_xscale = -1	
			current_x_velocity -= player_acceleration;	
		}
		if(move_right){
			image_xscale = 1	
			current_x_velocity += player_acceleration;
		}
		true_x += current_x_velocity
		true_y += current_y_velocity
		//this is how many pixels we plan to move this frame (not counting fractional parts)
		var tomovex = round(true_x);
		var tomovey = round(true_y);

		//get the fractional pixels left over after we move
		true_x -= tomovex
		true_y -= tomovey
		var dist_to_right_wall = room_width - x - 20;
		var dist_to_left_wall = x - 20;
		if (tomovex >= dist_to_right_wall){
			x = room_width - 21;
			current_x_velocity = abs(current_x_velocity) * -1;
			true_x =  0;
			//PLAY WALL BOUNCE SOUND HERE
			audio_play_sound(wallBounce, 10, false);
			
		}
		else if (tomovex < -dist_to_left_wall){
			x = 21;
			current_x_velocity = abs(current_x_velocity)
			true_x = 0;
			
		}
		else {
			//if not colliding a wall, just move our full velocity in x
			x += tomovex;
		}

		while (tomovey!=0)
		{
			//get the direction of vertical movement
			var sy = sign(tomovey);	//no matter what value the number has, this will give us if its +ve or -ve (i.e. +1 or -1)
			//move
			y = y + sy; //add to the y axis with whether we are moving up or down
			tomovey = tomovey - sy;
			
			if(y > player_stageY){
				y = player_stageY;
				is_on_ground = true;
			}
		}
		
}
	

