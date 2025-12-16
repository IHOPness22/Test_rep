//move
xspd = lengthdir_x(spd, dir);
yspd = lengthdir_y(spd, dir);

x += xspd;
y += yspd;

//cleanup

//hit confirm destroy
if hit_confirm == true && enemyDestroy == true
{ destroy = true;};

//destroy
if destroy == true { instance_destroy();};
    
//collision 
if place_meeting(x, y, Obj_solid)
{
    destroy = true;
}

//bullet out of range 
if point_distance( xstart, ystart, x, y) > maxDist
{
    destroy = true;
}