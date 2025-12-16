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
    
    //OG damage code, 
    //getting a single damage instance 
    //var hit = instance_place(x, y, Obj_damage_enemy);
    
    //take damage from speciifc instance
    //HP -= hit.damage;
    //instance_destroy(hit);
    
    //NEW damage code
    //getting a list of damage instance
    //create ds list and copy instances to it
    var _instList = ds_list_create();
    instance_place_list(x, y, Obj_damage_enemy, _instList, false);
    
    //get the size of the list
    var _listSize = ds_list_size(_instList);
    
    //loop through every index in the list
    for(var i = 0; i < _listSize; i++)
    {
        //get a damage object instance from a list
        var _inst = ds_list_find_value(_instList, i);
        
        //check if this instance is already in the damage list
        if ds_list_find_index(damageList, _inst) == -1
        {
            ds_list_add(damageList, _inst);
        }
        
        
        //take damage from specific instance
        HP -= _inst.damage;
        //tell the damage instance it has impacted
        //toggle this if you dont want the bullets to get destroyed
        _inst.hit_confirm = true;
        //}
        
        //if not touching the damage instance anymore, remove it from the LIST and set the loop back
        //1 position 
        var _damageListSize = ds_list_size(damageList);
        for (i=0; i < _damageListSize; i++) {
            _inst = ds_list_find_value( damageList, i);    
            if (!instance_exists(_inst) || !place_meeting(x, y, _inst)) 
            {
                ds_list_delete( damageList, i);
                i--;
                _damageListSize--;
            } 
        }
        
    }
    
    //free memory by destroying the ds list
    ds_list_destroy(_instList);
    
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
              
        

             