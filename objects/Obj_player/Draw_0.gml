//draw the weapon behind the player
if aimDir >= 0 && aimDir < 220 && global.holding_weapon == true && state != MOVEMENT_STATE.DASH
{
    draw_my_weapon();
}

//draw the player
draw_self();

//draw the weapon
if aimDir >= 220 && aimDir < 360 && global.holding_weapon == true && state != MOVEMENT_STATE.DASH
{
    draw_my_weapon();
}

//draw hp as a number
draw_text_colour(x, y, string(HP),c_green, c_green, c_green, c_green, true);


