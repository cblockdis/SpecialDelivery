/// @description Game Initiation
#macro TILE_SIZE 32
global.destination = undefined;

camera_set_view_size(view_camera[0], 1280, 960);
surface_resize(application_surface, 1280, 960);

tiles = sprite_get_width(sCol) / TILE_SIZE;
heightsToGet = tiles * TILE_SIZE;

// Create tile layer
var layerId = layer_create(0, "Tiles");
tileMapId = layer_tilemap_create(layerId, 0, 0, tCollision, tiles, 1);

// Create tiles
for (var i = 0; i <= tiles; i++)
{
	tilemap_set(tileMapId, i, i, 0);
	show_debug_message("Tile " + string(i) + " set");
}
