// Ensure it draws on top
depth = -999;

// Font for drawing inventory
global.font = Font1;

// Initialize item list only if it doesn't exist
if (!variable_global_exists("item_list")) {
    global.item_list = [
        { name:"Burger", description:"It's a Burger, recovers HP", sprite:s_c1, base_value:1 },
        { name:"Bomb", description:"Wow that's useless", sprite:s_c2, base_value:1 },
        { name:"Char 1", description:"A cool character", sprite:s_c1, base_value:3 },
        { name:"Char 2", description:"Another character", sprite:s_c2, base_value:3 }
    ];
}

// Initialize inventory only if it doesn't exist
if (!variable_global_exists("inv")) {
    global.inv = [];
}

// Drawing settings
sep = 16;
screen_bord = 16;
