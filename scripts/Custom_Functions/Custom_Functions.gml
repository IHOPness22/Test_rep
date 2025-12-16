//damage calculation


//damage create event
function get_damage_create(_hp = 10, _iframes = false) 
{
    damageList = ds_list_create();
    HP = _hp;
    
    //get the iframes
    if _iframes == true
    {
        iframeTimer = 0;
        iframeNumber = 90;
    }
    
    //create the damage list
    if _iframes == false
    {
        damageList = ds_list_create();
    }
}


//damage step event 
function get_damaged(_damageObj, _iframes = false)
{
    //special exit for iframe timer    
    if _iframes == true && iframeTimer > 0
    {
        iframeTimer--;
        exit;
    }    
        
        
    // If enemy touches player 
    if (!place_meeting(x, y, _damageObj)) exit;
    
    
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
        instance_place_list(x, y, _damageObj, _instList, false);
    
    //get the size of the list
        var _listSize = ds_list_size(_instList);
    
    //loop through every index in the list
        var _hit_confirm = false;
        
        
        for(var i = 0; i < _listSize; i++)
        {
        //get a damage object instance from a list
            var _inst = ds_list_find_value(_instList, i);
        
        //check if this instance is already in the damage list
            if _iframes == true || ds_list_find_index(damageList, _inst) == -1
            {
                if _iframes == false
                {
                    ds_list_add(damageList, _inst);
                }
                //take damage from specific instance
                HP -= _inst.damage;
                //tell the damage instance to destroy itself
                //toggle this if you dont want the bullets to get destroyed
                _inst.hit_confirm = true;
                
                //stop the enemy to give player the time to run
                with (_inst) {
                    state = ENEMY_STATE.STOP;
                }
                
                if (_iframes) {
                    _hit_confirm = true;
                    break;
            }
            }
        
        
            }
            
            if _iframes == true && _hit_confirm == true
            {
                iframeTimer = iframeNumber;
            }
            
            //free memory by destroying the ds list
            ds_list_destroy(_instList);
           
            
        
        //if not touching the damage instance anymore, remove it from the LIST and set the loop back
        //1 position 
        if (!_iframes)
        {
            var _damageListSize = ds_list_size(damageList);
            for (var i=0; i < _damageListSize; i++) {
                var _dinst = ds_list_find_value( damageList, i);    
                if (!instance_exists(_dinst) || !place_meeting(x, y, _inst)) 
                {
                    ds_list_delete( damageList, i);
                    i--;
                    _damageListSize--;
                }   
            }
        }
            
    
    }
        
        //}
    
    



//damage clean up event
function get_damage_cleanup() 
{
    //do not need if we are using iframes
    if global.holding_weapon ds_list_destroy(damageList);
}