/// @description Update Camera

if (instance_exists(follow))
{
	xTo = follow.x;
	yTo = follow.y;	
}

x += (xTo - x) / 25;
y += (yTo - y) / 25;

x = clamp(x, view_w_half + buff, room_width - view_w_half - buff);
y = clamp(y, view_h_half + buff, room_height - view_h_half - buff);

camera_set_view_pos(camera, x - view_w_half, y - view_h_half);

// The background speeds can be ovewritten.
if (layer_exists("BackgroundA"))
	layer_x("BackgroundA", x * backgroundDelayA);
	
if (layer_exists("BackgroundB"))
	layer_x("BackgroundB", x * backgroundDelayB);
	
if (layer_exists("BackgroundC"))
	layer_x("BackgroundC", x * backgroundDelayC);
	
if (keyboard_check(vk_alt) && keyboard_check_pressed(vk_enter))
	AdjustCamera();