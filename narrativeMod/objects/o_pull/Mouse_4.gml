if (global.coins >= 1) {
    global.coins -= 1;

    var pull_table = [
    { spr: s_rare, anim_spr: s_rare_anim, weight: 5 },
    { spr: s_c1, anim_spr: s_c1_anim, weight: 47 },
	{ spr: s_c4, anim_spr: s_c4_anim, weight: 71 },
	{ spr: s_c5, anim_spr: s_c5_anim, weight: 30 },
	{ spr: s_c6, anim_spr: s_c6_anim, weight: 90 },
	// { spr: s_rare, anim_spr: s_rare_anim, weight: 5 } // 5% chance
	];

	// Picking
	var total_weight = 0;
	for (var i = 0; i < array_length(pull_table); i++) total_weight += pull_table[i].weight;

	var r = irandom(total_weight - 1);
	var cum_weight = 0;
	var chosen_entry;
	for (var i = 0; i < array_length(pull_table); i++) {
	    cum_weight += pull_table[i].weight;
	    if (r < cum_weight) {
	        chosen_entry = pull_table[i];
	        break;
	    }
	}

	var chosen_static = chosen_entry.spr;
	global.last_pull_sprite_static = chosen_static;
	global.last_pull_sprite_anim = chosen_entry.anim_spr;

    // Add to inventory
    var found = false;
    for (var i = 0; i < array_length(global.inv); i++) {
        if (global.inv[i].sprite == chosen_static) {
            global.inv[i].count += 1;
            found = true;
            break;
        }
    }

    if (!found) {
        for (var i = 0; i < array_length(global.item_list); i++) {
            if (global.item_list[i].sprite == chosen_static) {
                var new_item = global.item_list[i];
                array_push(global.inv, {
                    name: new_item.name,
                    description: new_item.description,
                    sprite: new_item.sprite,
                    count: 1,
                    base_value: new_item.base_value
                });
                break;
            }
        }
    }

    // Switch to pull result room
    room_goto(rm_pull_result);

} else {
    show_message("Not enough coins!");
}
