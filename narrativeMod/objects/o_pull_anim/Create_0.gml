// o_pull_anim Create Event

// Animation control
anim_finished = false;
image_index = 0;
image_speed = 0.2; // Must be > 0 for animation to play

// Center the sprite
x = 0;
y = 0;

// Use the pulled animation sprite
if (variable_global_exists("last_pull_sprite_anim")) {
    sprite_index = global.last_pull_sprite_anim;
} else {
    sprite_index = s_c1_anim; // fallback
}

// rm_pull_result Create Event

