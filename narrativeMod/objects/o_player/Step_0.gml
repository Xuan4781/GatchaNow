var move = 4;
var moving = false;

// LEFT
if (keyboard_check(vk_left)) {
    if (!place_meeting(x - move, y, o_wall)) {
        x -= move;
    }
    sprite_index = s_playerleftidle; // default
    if (keyboard_check(vk_left)) sprite_index = s_playerleftrun;
    last_hdir = "left";
    moving = true;
}

// RIGHT
if (keyboard_check(vk_right)) {
    if (!place_meeting(x + move, y, o_wall)) {
        x += move;
    }
    sprite_index = s_playerrightrun;
    last_hdir = "right";
    moving = true;
}

// UP
if (keyboard_check(vk_up)) {
    if (!place_meeting(x, y - move, o_wall)) {
        y -= move;
    }
    moving = true;
    // Reuse last horizontal direction
    if (last_hdir == "left") {
        sprite_index = s_playerleftidle;
    } else {
        sprite_index = s_playerrightrun;
    }
}

// DOWN
if (keyboard_check(vk_down)) {
    if (!place_meeting(x, y + move, o_wall)) {
        y += move;
    }
    moving = true;
    if (last_hdir == "left") {
        sprite_index = s_playerleftidle;
    } else {
        sprite_index = s_playerrightrun;
    }
}

// If not moving, set idle sprite
if (!moving) {
    if (last_hdir == "left") {
        sprite_index = s_playerleftidle;
    } else {
        sprite_index = s_playerrightidle;
    }
}

// Collision with enemy
if (place_meeting(x, y, o_enemy)) {
    global.coins = 0;
    var safe_inst = instance_nearest(x, y, o_safeSpot);
    if (safe_inst != noone) {
        x = safe_inst.x;
        y = safe_inst.y;
    }
}
// Update last safeSpot the player is on
var safe_inst = instance_place(x, y, o_safeSpot);
if (safe_inst != noone) {
    global.last_safeSpot = safe_inst;
}
