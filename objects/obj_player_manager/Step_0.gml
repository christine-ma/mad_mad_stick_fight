move_left = keyboard_check(left_key);
move_right = keyboard_check(right_key);
jump = keyboard_check(jump_key);
attack = keyboard_check_pressed(attack_key);

//Stop user input movement
if(stop_movement == true){
	jump = noone;
	move_left = noone;
	move_right = noone;
	attack = noone;
	if(stop_frames > stop_max_frames){
		stop_movement = false;
		stop_frames = 0;
	}
	stop_frames++;
	
}
else{
	//slow the player down a little every frame (helps to make it easier to control)
	current_x_velocity *= 0.9;
	//gravity accelerates the player down.
	current_y_velocity += grav;

	//Change to jumping in air 
	if(jump and is_on_ground == true){
		current_y_velocity = bounce_velocity;
		is_on_ground = false;
	}
	if(is_on_ground){
		//Todo: make boundary for moving on ground
			if(move_left){
				image_xscale = -1	
				x -= move_speed;
			}
			if(move_right){
				image_xscale = 1	
				x += move_speed;
			}
	}
	else{
		jump_state();
	}

	//Player Attacks
	opponent_collision = place_meeting(x,y,opponent);

	if(attack and opponent_collision){
			opponent.current_health--;
			//knock opponent back
			if(image_xscale == -1){
				opponent.x -= 45;
			}
			else if (image_xscale == 1){
				opponent.x += 45;
			}
			jump = noone;
			move_left = noone;
			move_right = noone;
			attack = noone;
			obj_view_manager.shake = true;
			stop_movement = true;
			opponent.stop_movement = true;
	}


	//Change player depth
	if(opponent_collision and (move_left or move_right)){
		depth = opponent.depth-5;
	}


	

	if (current_x_velocity > 0){
		image_xscale = -1	
		
	}
	else if (current_x_velocity < 0){
		image_xscale = 1	
	}
	combo_collision = place_meeting(x,y,obj_combo_activator);
	if(combo_collision){
		combo = true;
		//Possible set stop movement to true
		obj_combo_manager.combo_activated = true;
	}
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
	//Game over
	//room_goto(rm_end);
	//Death State
}
//Player Stage Boundaries


function jump_state(){
	if(move_left){
			current_x_velocity -= player_acceleration;	
		}
		if(move_right){
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
		//var colliding = false; 
		//var bread_ground = noone;
		while (tomovey!=0)
		{
			//get the direction of vertical movement
			var sy = sign(tomovey);	//no matter what value the number has, this will give us if its +ve or -ve (i.e. +1 or -1)
			//move
			y = y + sy; //add to the y axis with whether we are moving up or down
			tomovey = tomovey - sy;
			//if colliding with ground, stop movement and return to idle
			/*bread_platform = instance_position(x,y+sy,obj_bread);
			if ((bread_platform != noone or bread_base != noone)) { //touching a bread
				if(sprite_index == down){
					colliding = true;
					//only collide if not already overlapping
					if(instance_exists(bread_platform)){
						if (place_meeting(x,y,bread_platform)==false){
								//Stop jumping
								air = false;
								break;
						}
						
					}
					
					if(place_meeting(x,y,bread_base)==true){
						air = false;
						break;
					}
				}
			}*/
			if(y > player_stageY){
				y = player_stageY;
				is_on_ground = true;
			}
		}
		if (current_y_velocity > 0) {
			//show downward movement sprites
			/*if(air==false){
				sprite_index = idle;
			}
			else if (sprite_index != down) {
				image_speed=1;
				image_index = 0;
				sprite_index = down;
			}*/
		}
		else {
			//show upward movement sprites
			/*if (sprite_index != up) {
				image_speed= 1;
				image_index = 0;
				sprite_index = up;
			}	*/
		}
}
	

