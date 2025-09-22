var num_enemies = 2;

// Only spawn if o_safeSpot exists
if (instance_exists(o_safeSpot)) {
    while (instance_number(o_enemy) < num_enemies) {
        var tries = 0;
        var placed = false;

        while (!placed && tries < 100) {
            var ex = irandom(room_width - 32);
            var ey = irandom(room_height - 32);
            tries += 1;

            if (!position_meeting(ex, ey, o_wall) && !position_meeting(ex, ey, o_safeSpot)) {
                instance_create_layer(ex, ey, "Instances", o_enemy);
                placed = true;
            }
        }

        // If after 100 tries we still couldn't place, break to prevent infinite loop
        if (!placed) break;
    }
}
