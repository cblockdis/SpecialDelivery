/// @description Sets the dimensions and aspect ratio between different view modes when toggled.
function AdjustCamera(){
	var baseWidth = 640;
	var baseHeight = 480;
	var maxWidth = display_get_width();
	var maxHeight = display_get_height();
	var newWidth;
	var newHeight;
	
	if (window_get_fullscreen())
	{
		var aspect = maxWidth / maxHeight;
		var viewHeight = min(baseHeight, maxHeight);
		var viewWidth = viewHeight * aspect;
		newWidth = floor(viewWidth);
		newHeight = floor(viewHeight);
		view_wport[0] = maxWidth;
		view_hport[0] = maxHeight;
	}
	else 
	{
		newWidth = 640;
		newHeight = 480;
		view_wport = newWidth;
		view_hport = newHeight;
	}

	camera_set_view_size(view_camera[0], newWidth, newHeight);
	surface_resize(application_surface, view_wport[0], view_hport[0]);
}