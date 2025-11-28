/// Draw GUI Event of Obj_menu

// ------ Font & color ------
draw_set_font(fnt_earthbound); 
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

// ------ Layout settings ------
var box_x   = 24;   // window X position
var box_y   = 24;   // window Y position
var padding = 12;   // inner padding
var line_h  = 22;   // vertical spacing between options
var box_w   = 190;  // window width

// Height depends on number of options
var box_h = padding * 2 + array_length(menu_options) * line_h;

// ------ shadow behind window (EarthBound-ish) ------
draw_set_color(c_dkgray);
draw_rectangle(box_x + 3, box_y + 3, box_x + box_w + 3, box_y + box_h + 3, false);

// ------ Window background (black, filled) ------
draw_set_color(c_black);
draw_rectangle(box_x, box_y, box_x + box_w, box_y + box_h, false);

// ------ Double white border (thick EB-style outline) ------
draw_set_color(c_white);

// Inner border
draw_rectangle(box_x - 1, box_y - 1, box_x + box_w + 1, box_y + box_h + 1, true);

// Outer border
draw_rectangle(box_x - 3, box_y - 3, box_x + box_w + 3, box_y + box_h + 3, true);

// ------ Draw options ------
for (var i = 0; i < array_length(menu_options); i++)
{
    var yy = box_y + padding + i * line_h;
    draw_text(box_x + padding + 12, yy, string(menu_options[i]));
}

// ------ Draw arrow next to selected option ------
var arrow_x = box_x + padding;
var arrow_y = box_y + padding + menu_selection * line_h;

draw_text(arrow_x, arrow_y, ">");

