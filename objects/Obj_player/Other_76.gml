GrassEff = array_create(3);
var num1 = random_range(0,2);
array_insert(GrassEff, 0, Footstep_grass_1);
array_insert(GrassEff, 1, Footstep_grass_2);
array_insert(GrassEff, 2, Footstep_grass_3);

//-------------ADD A NEW GLOBAL VARIABLE THAT TRACKS IF YOUR ON GRASS OR NOT LATER
//------------- FOR NOW THIS WORKS

if(event_data[? "event_type"] == "sprite event") {
	if(event_data[? "message"] == "Footstep" and Obj_player.x > 750 and Obj_player.x < 880 and Obj_player.y > 270 and Obj_player.y < 400)
		audio_play_sound(GrassEff[num1], 0, 0);
	else 
		audio_play_sound(Footstep_concrete, 0, 0);
}