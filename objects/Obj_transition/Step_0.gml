switch (state) {

    case TRANSITION_STATE.OUT:
        // Play sprite FORWARD
        frame += frame_speed;

        if (frame >= frame_count - 1) {
            frame = frame_count - 1;

            // Once we've finished the OUT animation, switch rooms
            if (room_exists(target_room)) {
                room_goto(target_room);
            }

            // Start playing backwards in the new room
            state = TRANSITION_STATE.IN;
        }
    break;


    case TRANSITION_STATE.IN:
        // Play sprite BACKWARD
        frame -= frame_speed;

        if (frame <= 0) {
            frame = 0;
            instance_destroy(); // done with transition
        }
    break;
}

