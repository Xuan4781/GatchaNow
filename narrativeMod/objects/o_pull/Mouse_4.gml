if (global.coins >= 1) {
    global.coins -= 1;
	// need to add more characters
    var chars = [s_c1, s_c2];
    var chosen_sprite = chars[irandom(array_length(chars)-1)];

    // remove the previous pull
    if (global.current_pull != noone && instance_exists(global.current_pull)) {
        instance_destroy(global.current_pull);
    }

    // Create new character in gacha room
    var spawn_x = room_width / 2;
    var spawn_y = room_height / 2;
    global.current_pull = instance_create_layer(spawn_x, spawn_y, "Instances", o_character);
    global.current_pull.sprite_index = chosen_sprite;

    // Add to inventory
    array_push(global.inventory, chosen_sprite);

} else {
    show_message("Not enough coins!");
}
