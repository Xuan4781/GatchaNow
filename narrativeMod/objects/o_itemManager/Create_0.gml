/// o_ItemManager: Create / Draw / Step combined setup

// Draw on top
depth = -999;

// Use dedicated small font for inventory text
if (!variable_global_exists("FontSmall")) {
    global.FontSmall = Font1; // Assign the small font resource
}
global.font = global.FontSmall;

// Initialize item list if it doesn't exist
if (!variable_global_exists("item_list")) {
    global.item_list = [
        { name:"Burger", description:"It's a Burger, recovers HP", sprite:s_c1, base_value:1 },
        { name:"Rare Char", description:"A super rare character", sprite:s_rare, base_value:10 },
		{ name:"Rejection", description:"Useless", sprite:s_c4, base_value:1 },
		{ name:"Resume", description:"some working paper", sprite:s_c5, base_value:3 },
		{ name:"Mcdonalds", description:"an option", sprite:s_c6, base_value:3 }
    ];
}

// Initialize inventory if it doesn't exist
if (!variable_global_exists("inv")) {
    global.inv = [];
}

// Inventory drawing settings
sep = 16;                // vertical spacing between items
screen_bord_x = 10;      // left margin
screen_bord_y = 10;      // top margin
inv_sprite_scale = 0.4;  // scale for inventory sprites
text_offset_x = 18;      // horizontal offset for text relative to sprite
text_offset_y = 2;       // vertical offset for text relative to sprite