// Ensure it draws on top
depth = -999;

// Font for drawing inventory
global.font = Font1;

// Item constructor
function create_item(_name, _desc, _spr) constructor {
    name = _name;
    description = _desc;
    sprite = _spr;
}

// Initialize items
global.item_list = [
    { name:"Burger", description:"It's a Burger, recovers HP", sprite:s_c1, base_value:1 },
    { name:"Bomb", description:"Wow that's useless", sprite:s_c2, base_value:1 },
    { name:"Char 1", description:"A cool character", sprite:s_c1, base_value:3 },
    { name:"Char 2", description:"Another character", sprite:s_c2, base_value:3 }
];



// Inventory array
global.inv = [];

// Drawing settings
sep = 16;
screen_bord = 16;
