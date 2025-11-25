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

if (dist <= stop_radius) {
    global.can_move = false;
     if (!instance_exists(Obj_transition)) {
        var t = instance_create_layer(x, y, "Instances", Obj_transition);
        t.target_room = battle_room;
    }
}              