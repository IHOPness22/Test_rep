var w = display_get_gui_width();
var h = display_get_gui_height();

// draw your sprite full screen
var subimg = clamp(floor(frame), 0, frame_count - 1);
draw_sprite_stretched(spr, subimg, 0, 0, w, h);

// black overlay (EarthBound fade-to-black)
draw_set_color(c_black);
draw_set_alpha(alpha);
draw_rectangle(0, 0, w, h, false);
draw_set_alpha(1);


