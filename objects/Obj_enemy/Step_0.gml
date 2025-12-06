#region 
//--------------------------ENEMY AI-------------------------------------
var dist = point_distance(x,y,Obj_player.x, Obj_player.y)
var follow_radius = 60;
var stop_radius = 16;
var slime = global.Slime;


//this is only for chase in overworld
if !global.holding_weapon
{
	if (dist < follow_radius and dist > stop_radius and global.can_move) { 
		move_towards_point(Obj_player.x, Obj_player.y, 1);
}
else {
    speed = 0;
}

if (dist <= stop_radius) {
    global.can_move = false;
    global.enemy_encounter = "Slime";
     if (!instance_exists(Obj_transition)) {
        var t = instance_create_layer(x, y, "Instances", Obj_transition);
        t.target_room = battle_room;
    }
} 
}


//these are mechanics for battle room 
// collision with player attack / damage object
if global.holding_weapon
{
    // If enemy touches player 
if place_meeting(x, y, Obj_damage_enemy)
{
    var hit = instance_place(x, y, Obj_damage_enemy);
    HP -= hit.damage;
    instance_destroy(hit);
}

// death check
if (HP <= 0)
{
    instance_destroy();
} 
    
    
    
//going to experiment with this code later to ensure
//collsions are to a tea with game logic        
/*    
    if instance_exists(oPlayer)
    {
        dir = point_direction(x, y, Obj_player.x, Obj_player.y);
    }
    
    xspd = lengthdir_x(speed, dir);
    yspd = lengthdir_y(speed, dir);
  
    
    
//collision  
    if place_meeting(x + xspd, y, Obj_solid)
    {
        xspd = 0;
    } 
    if place_meeting(x, y + yspd, Obj_solid)
    {
        yspd = 0;
    } 
 */   
           

    
#endregion    
    
//Enemy AI
/*     
    if (stop_timer > 0) 
    {
        speed = 0;
        stop_timer--;
        
    }
    else {
        if (run_timer > 0)
        {
            move_towards_point(Obj_player.x, Obj_player.y, 1);
            run_timer--;
        }
        else {
        	run_time = irandom_range(3, 5);
            run_timer = run_time * room_speed;
            stop_time = irandom_range(3, 5);
            stop_timer = stop_time * room_speed;
        }
    }           
   */ 






//Experimental state machines

switch (state) {
    case ENEMY_STATE.STOP:
        if (stop_timer > 0)
        {
            speed = 0;
            stop_timer--;
        }
        else {
        state = ENEMY_STATE.MOVE;
        }
        break;
    case ENEMY_STATE.MOVE: 
        if (run_timer > 0)
        {
            move_towards_point(Obj_player.x, Obj_player.y, 1);
            run_timer--;
        } 
        else {
            run_time = irandom_range(3, 5);
            run_timer = run_time * room_speed;
            stop_time = irandom_range(3, 5);
            stop_timer = stop_time * room_speed;
            state = ENEMY_STATE.DASH;
        }
        break; 
    case ENEMY_STATE.DASH:
        if (jumpTimer == 0) {
            hop_speed = irandom_range(3,4);
            jumpTimer = irandom_range(20, 30);
            var jump_direction = point_direction(x, y, Obj_player.x, Obj_player.y)
            direction = jump_direction;
            speed = hop_speed;
        }
        else {
            jumpTimer--;
            if (jumpTimer <= 0) {
                speed = 0;
                var decide_state = irandom_range(1,2);
                if decide_state == 1 {
                    state = ENEMY_STATE.STOP;
                }
                else if decide_state == 2 {
                    state = ENEMY_STATE.MOVE;
                }
            }
        } 
        break;  
            
            
            
             
        
    
}
    
    
}
              
        

             