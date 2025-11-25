//--------------------------ENEMY AI-------------------------------------
var dist = point_distance(x,y,Obj_player.x, Obj_player.y)
var follow_radius = 45;
var stop_radius = 22;

if (dist < follow_radius and dist > stop_radius) { 
    move_towards_point(Obj_player.x, Obj_player.y, 1);
	sprite_index = Fire_idle_1;
	
}
else {
    speed = 0;
	sprite_index = Fire_Idle
}


//--------------------------IF ENEMY TOUCHES, TELEPORT TO BATTLE ROOM----
if (dist <= stop_radius) {
     if (!instance_exists(Obj_transition)) {
        var t = instance_create_layer(x, y, "Instances", Obj_transition);
        t.target_room = battle_room;
    }
}         