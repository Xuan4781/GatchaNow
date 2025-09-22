// o_player: Create Event
last_hdir = "right"; // default facing direction
// o_player: Create Event
if (!variable_global_exists("move_to_last_safe")) {
    global.move_to_last_safe = false;
}

if (!variable_global_exists("last_safeSpot")) {
    global.last_safeSpot = noone;
}
