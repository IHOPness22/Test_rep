//damage calculation


//damage create event
function get_damage_create(_hp = 10, _canflicker = false) 
{
    damageList = ds_list_create();
    HP = _hp;
    iframeTimer = 0;
    iframeNumber = 120;
    
}


//damage step event 
function get_damaged(_damageObj, _canflicker = false)
{
    
    //special exit for iframe timer    
    if (iframeTimer > 0 && can_iframes)
    {
        iframeTimer--;
        if _canflicker == true 
        {    
        //keep flickering player sprite unitl invincibility is over
        if iframeTimer mod 5 == 0
        {
            if image_alpha == 1
            {
                image_alpha = 0;
            } else {
                image_alpha = 1;
            }
        }
        }
        exit; 
    }
    
    
    image_alpha = 1;   
        
        
    // If enemy is not touching player then exit
    if (!place_meeting(x, y, _damageObj)) exit;
    
    //NEW damage code
    //getting a list of damage instance
    //create ds list and copy instances to it
        var _instList = ds_list_create();
        instance_place_list(x, y, _damageObj, _instList, false);
    
    //get the size of the list
        var _listSize = ds_list_size(_instList);
    
    //loop through every index in the list
        var _hit_confirm = false;
        
        if (iframeTimer <= 0) { 
        for(var i = 0; i < _listSize; i++)
        {
        //get a damage object instance from a list
            var _inst = ds_list_find_value(_instList, i);
        
        //check if this instance is already in the damage list
            if ds_list_find_index(damageList, _inst) == -1 
            {
                
                ds_list_add(damageList, _inst);
                //take damage from specific instance
                HP -= _inst.damage;
                //tell the damage instance to destroy itself
                //toggle this if you dont want the bullets to get destroyed
                _inst.hit_confirm = true;
                _hit_confirm = true;
                break;
                
                //stop the enemy to give player the time to run
                
            }
        
        
            }
        }
            
            if (_hit_confirm == true && can_iframes)
            {
                iframeTimer = iframeNumber;
            }
            
            //free memory by destroying the ds list
            ds_list_destroy(_instList);
           
            
        
        //if not touching the damage instance anymore, remove it from the LIST and set the loop back
        //1 position 
            if (iframeTimer <= 0) {
            var _damageListSize = ds_list_size(damageList);
            for (var i=0; i < _damageListSize; i++) {
                var _dinst = ds_list_find_value( damageList, i);    
                if (!instance_exists(_dinst) || !place_meeting(x, y, _dinst)) 
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