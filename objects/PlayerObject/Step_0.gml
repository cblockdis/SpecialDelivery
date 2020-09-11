/// @description Player movement and collision
if (hascontrol)
{
	var bBoxSide;
	var p1, p2;

	keyRight = keyboard_check_direct(vk_right);
	keyLeft = keyboard_check_direct(vk_left);
	jump = keyboard_check_pressed(vk_space);
	//keyDown = keyboard_check(vk_down);

	move = (keyRight - keyLeft) * SPEED_WALK;
	hSpeed = move;
	vSpeed += SPEED_GRAVITY;

	// Check middle-center is touching the floor.
	var grounded = (InFloor(tileMap, x, bbox_bottom + 1) >= 0);

	if (grounded || (InFloor(tileMap, bbox_left, bbox_bottom + 1) >= 0) || (InFloor(tileMap, bbox_right, bbox_bottom + 1) >= 0))
	{
		if (jump)
		{
			vSpeed = -SPEED_JUMP;
			grounded = false;
		}
	}

	hSpeed += hSpeedFraction;
	vSpeed += vSpeedFraction;

	hSpeedFraction = hSpeed - (floor(abs(hSpeed)) * sign(hSpeed));
	hSpeed -= hSpeedFraction;
	vSpeedFraction = vSpeed - (floor(abs(vSpeed)) * sign(vSpeed));
	vSpeed -= vSpeedFraction;

	if (hSpeed > 0) 
		bBoxSide = bbox_right; 
	else
		bBoxSide = bbox_left;
	
	p1 = tilemap_get_at_pixel(tileMap, bBoxSide + hSpeed, bbox_top);
	p2 = tilemap_get_at_pixel(tileMap, bBoxSide + hSpeed, bbox_bottom);

	if (tilemap_get_at_pixel(tileMap, x, bbox_bottom) > 1)
		p2 = 0;

	if (p1 == 1) || (p2 == 1)
	{
		if (hSpeed > 0)
			x = x - (x mod TILE_SIZE) + (TILE_SIZE - 1) - (bbox_right - x);
		else 
			x = x - (x mod TILE_SIZE) - (bbox_left - x);
		
		hSpeed = 0;		
	}

	x += hSpeed;

	// Vertical collision
	if (tilemap_get_at_pixel(tileMap, x, bbox_bottom + vSpeed) <= 1)
	{
		if (vSpeed >= 0)
			bBoxSide = bbox_bottom; 
		else
			bBoxSide = bbox_top;
		
		p1 = tilemap_get_at_pixel(tileMap, bbox_left, bBoxSide + vSpeed);
		p2 = tilemap_get_at_pixel(tileMap, bbox_right, bBoxSide + vSpeed);
	
		if (p1 == 1) || (p2 == 1)
		{
			if (vSpeed >= 0)
				y = y - (y mod TILE_SIZE) + (TILE_SIZE - 1) - (bbox_bottom - y);
			else
				y = y - (y mod TILE_SIZE) - (bbox_top - y);
		
			vSpeed = 0;
		}
	}

	var floorDistance = InFloor(tileMap, x, bbox_bottom + vSpeed);

	if (floorDistance >= 0)
	{
		y += vSpeed;
		y -= (floorDistance + 1);
		vSpeed = 0;
		floorDistance = -1;
	}

	y += vSpeed;

	if (grounded)
	{
		y += abs(floorDistance) - 1;
	
		if ((bbox_bottom mod TILE_SIZE) == TILE_SIZE - 1)
		{
			if (tilemap_get_at_pixel(tileMap, x, bbox_bottom + 1) > 1)
			{
				y += abs(InFloor(tileMap, x, bbox_bottom + 1));
			}
		}
	}

} 



