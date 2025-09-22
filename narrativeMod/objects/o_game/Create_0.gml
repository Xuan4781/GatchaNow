// Track coins and current pull
global.coins = 0;
global.current_pull = noone;
// Desired window size (bigger window)
var win_w = 1290; // double room width
var win_h = 574;  // double room height

// Set the application surface scaling
surface_resize(application_surface, win_w, win_h);

// Resize the actual game window
window_set_size(win_w, win_h);
