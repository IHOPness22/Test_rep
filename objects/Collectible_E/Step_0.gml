var dist = point_distance(x,y,Obj_player.x, Obj_player.y);
var visible_dist = 20;


if (dist <= visible_dist and !global.collected and global.can_collect)
	visible = true;
else
	visible = false;


	