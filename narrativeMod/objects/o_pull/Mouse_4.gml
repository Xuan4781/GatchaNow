if (global.coins >= 1) {
    global.coins -= 1;

    // Choose random character (static sprite for inventory)
    var chars = [s_c1, s_c2];   // STATIC SPRITES ONLY
    var chosen_static = chars[irandom(array_length(chars)-1)];

    // Store pulled sprite for inventory
    global.last_pull_sprite_static = chosen_static;

    // Store animation sprite for middle animation
    if (chosen_static == s_c1) {
        global.last_pull_sprite_anim = s_c1_anim;
    } else if (chosen_static == s_c2) {
        global.last_pull_sprite_anim = s_c2_anim;
    }

    // --- Add to inventory ---
    var found = false;
    for (var i = 0; i < array_length(global.inv); i++) {
        if (global.inv[i].sprite == chosen_static) {
            global.inv[i].count += 1;
            found = true;
            break;
        }
    }

    if (!found) {
        // Look up item in item_list
        for (var i = 0; i < array_length(global.item_list); i++) {
            if (global.item_list[i].sprite == chosen_static) {
                var new_item = global.item_list[i];
                array_push(global.inv, {
                    name: new_item.name,
                    description: new_item.description,
                    sprite: new_item.sprite, // static sprite
                    count: 1,
                    base_value: new_item.base_value
                });
                break;
            }
        }
    }

    // Go to pull result room
    room_goto(rm_pull_result);

} else {
    show_message("Not enough coins!");
}
