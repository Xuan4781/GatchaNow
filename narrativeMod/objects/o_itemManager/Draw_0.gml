// DRAW INVENTORY (only if not in gacha room)
if (room != gacha) {
    draw_set_font(global.FontSmall); // tiny font, e.g., 6 px
    draw_set_color(c_white);

    for (var i = 0; i < array_length(global.inv); i++) {
        var _xx = screen_bord_x;
        var _yy = screen_bord_y + sep * i;

        // Draw inventory sprite scaled down
        draw_sprite_ext(global.inv[i].sprite, 0, _xx, _yy, inv_sprite_scale, inv_sprite_scale, 0, c_white, 1);

        // Build name text
        var name_text = global.inv[i].name;
        if (global.inv[i].count > 1) {
            name_text += " x" + string(global.inv[i].count);
        }

        // Draw text normally
        draw_text(_xx + text_offset_x, _yy + text_offset_y, name_text);
    }
}
