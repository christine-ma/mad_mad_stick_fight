//Player Data

//Health Bar
current_health = 10;

//Player States
is_on_ground = true;

//actions
//damaged - lose health when hit by other player
is_hit = false; //true = stun and shake screen

left_key = ord("A");
right_key = ord("D");
jump_key = ord("W");
attack_key = ord("S");



//Jump physics
current_x_velocity = 0;
current_y_velocity = 0;
true_x = 0;
true_y = 0;

grav = 0.7;

bounce_velocity = -18;//need this to be a negative value so we move upwards
player_acceleration = 1.5;

//Move when on ground
move_speed=6;

//Spawn Player Blue and Player Pink
//Set opponent
opponent = obj_playerPink;
