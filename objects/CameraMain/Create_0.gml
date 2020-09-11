/// @description Initialize Camera
//shake_length = 60;
//shake_magnitude = 6;
//shake_remain = 6;
buff = 32;

// Scale camera / viewport to match player's screensize. 
AdjustCamera();

// Initialize the camera and center it on player.
camera = view_camera[0];
view_w_half = camera_get_view_width(camera) * 0.5;
view_h_half = camera_get_view_height(camera) * 0.5;
xTo = xstart;
yTo = ystart;

// 640 x 480
// 