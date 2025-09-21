// Check if player has coins
if (global.coins >= 1) {
    global.coins -= 1;

    // Choose a random character for the pull
    var chars = [s_c1, s_c2];
    var chosen_sprite = chars[irandom(array_length(chars)-1)];

    // Remove previous pull display if exists
    if (global.current_pull != noone && instance_exists(global.current_pull)) {
        instance_destroy(global.current_pull);
    }

    // Spawn new character in the gacha room
    var spawn_x = room_width / 2;
    var spawn_y = room_height / 2;
    global.current_pull = instance_create_layer(spawn_x, spawn_y, "Instances", o_character);
    global.current_pull.sprite_index = chosen_sprite;

    // Check if pulled item already exists in inventory
    var found = false;
    for (var i = 0; i < array_length(global.inv); i++) {
        if (global.inv[i].sprite == chosen_sprite) {
            global.inv[i].count += 1;  // increment count for duplicates
            found = true;
            break;
        }
    }

    // If not found, add new item with count = 1
    if (!found) {
        var new_item = undefined;

        // Search in the item list
        for (var i = 0; i < array_length(global.item_list); i++) {
            if (global.item_list[i].sprite == chosen_sprite) {
                new_item = global.item_list[i];
                break;
            }
        }

        if (new_item != undefined) {
            // Copy item and add count & base_value
            var item_copy = {
                name: new_item.name,
                description: new_item.description,
                sprite: new_item.sprite,
                count: 1,
                base_value: new_item.base_value
            };

            array_push(global.inv, item_copy);
        }
    }

} else {
    show_message("Not enough coins!");
}
