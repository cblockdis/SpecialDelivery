/// @description Draw rectangle over screen;
if (transMode != TRANS_MODE.OFF)
{
	draw_set_alpha(percent);
	draw_set_color(c_black);
	draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
	draw_set_alpha(1);
}
