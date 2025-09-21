draw_set_font(global.font);

for (var i = 0; i < array_length(global.inv); i++) {
    var _xx = screen_bord;
    var _yy = screen_bord + sep * i;

    draw_sprite(global.inv[i].sprite, 0, _xx, _yy);

    var name_text = global.inv[i].name;
    if (global.inv[i].count > 1) {
        name_text += " x" + string(global.inv[i].count);
    }

    // Show sell value next to item
    if (variable_instance_exists(global.inv[i], "base_value")) {
        name_text += " (Sell: " + string(global.inv[i].base_value) + ")";
    }

    draw_text(_xx + 40, _yy, name_text);
}
