/// @description Checks to see if position is below the floor height of a given tile, returns how deep in floor
/// @arg tileMap
/// @arg xPos
/// @arg yPos
function InFloor(tileMap, xPos, yPos) {
	var pos = tilemap_get_at_pixel(tileMap, xPos, yPos);
	
	if (pos > 0)
	{
		if (pos == 1) return (yPos mod TILE_SIZE); 
		var thefloor = global.heights[(xPos mod TILE_SIZE) + pos * TILE_SIZE];
		return ((yPos mod TILE_SIZE) - thefloor);
	} 
	else 
		return -(TILE_SIZE - (yPos mod TILE_SIZE));
}