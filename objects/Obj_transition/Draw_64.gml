var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();

// Convert our float frame value to an integer subimage index
var subimg = clamp(floor(frame), 0, frame_count - 1);

// Stretch your sprite to the full GUI size
draw_sprite_stretched(spr, subimg, 0, 0, gui_w, gui_h);

