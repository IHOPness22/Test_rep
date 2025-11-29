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

}
             