if (mouse_check_button_pressed(mb_left)) {
    for (var i = 0; i < array_length(global.inv); i++) {
        var _xx = screen_bord;
        var _yy = screen_bord + sep * i;

        var w = 32; // approximate sprite width
        var h = 32; // approximate sprite height

        // If mouse clicked on item sprite
        if (mouse_x > _xx && mouse_x < _xx + w &&
            mouse_y > _yy && mouse_y < _yy + h) {

            var sell_value = 1; // default sell value
            if (variable_instance_exists(global.inv[i], "base_value")) {
                sell_value = global.inv[i].base_value;
            }

            // Add coins
            global.coins += sell_value;

            // Reduce count or remove item
            global.inv[i].count -= 1;
            if (global.inv[i].count <= 0) {
                array_delete(global.inv, i, 1);
            }

            break; // only sell one item per click
        }
    }
}
