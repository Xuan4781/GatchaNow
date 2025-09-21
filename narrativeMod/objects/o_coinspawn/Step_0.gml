var max_coins = 5;

if(instance_number(o_coin) < max_coins){
	var cx = irandom(room_width - 32);
	var cy = irandom(room_height -32);
	instance_create_layer(cx, cy, "Instances", o_coin)
}