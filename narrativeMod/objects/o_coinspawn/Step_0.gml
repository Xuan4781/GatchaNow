var max_coins = 5;
var buffer = 16; // distance from walls to avoid

if (instance_number(o_coin) < max_coins) {
    var attempts = 0;
    var placed = false;

    while (!placed && attempts < 50) { // try more times to find a safe spot
        attempts += 1;

        var cx = irandom(room_width - 32);
        var cy = irandom(room_height - 32);

        // Check collision with walls using collision_rectangle
        var left = cx - buffer;
        var top = cy - buffer;
        var right = cx + 32 + buffer;
        var bottom = cy + 32 + buffer;

        if (collision_rectangle(left, top, right, bottom, o_wall, false, true) == noone) {
            instance_create_layer(cx, cy, "Instances", o_coin);
            placed = true;
        }
    }
}
