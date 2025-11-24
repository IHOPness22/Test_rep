//--------------------------ENEMY AI-------------------------------------
var dist = point_distance(x,y,Obj_player.x, Obj_player.y)
var follow_radius = 60;
var stop_radius = 16;

if (dist < follow_radius and dist > stop_radius) { 
    move_towards_point(Obj_player.x, Obj_player.y, 1);
}
else {
    speed = 0;
}


//--------------------------IF ENEMY TOUCHES, TELEPORT TO BATTLE ROOM----
if (dist <= stop_radius) {
    room_goto(battle_room);
}