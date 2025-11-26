var dist = point_distance(x,y,Obj_player.x, Obj_player.y);
var collect_dist = 20;

if(dist <= collect_dist)
	global.can_collect = true;
else
	global.can_collect = false;

if(global.collected)
	visible = false;
