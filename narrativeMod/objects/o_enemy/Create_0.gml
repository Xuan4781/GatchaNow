// Scale reset
image_xscale = 1;
image_yscale = 1;

// Movement variables
move_dir = irandom(360);
move_speed = 2;
random_speed = 1;
change_dir_chance = 5;
avoid_dist = 64;

// Dialogue variables
dialogue_text = "";
dialogue_timer = 0;
dialogue_interval = room_speed * 10; // 10 seconds

// Sprite defaults
sprite_index = s_enemyright;
