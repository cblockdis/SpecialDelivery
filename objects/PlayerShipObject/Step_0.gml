/// @description Ship Movement Logic
if (hascontrol)
{
	var xtravel = 0 + (keyboard_check(vk_left) * -1) + (keyboard_check(vk_right) * 1);
	var ytravel = 0 + (keyboard_check(vk_up) * -1) + (keyboard_check(vk_down) * 1);
	
	var xmove = (MOVE_SPEED * xtravel);
	var ymove = (MOVE_SPEED * ytravel);
	var movDirection = point_direction(0,0,xmove,ymove);
	xmove = xmove * dcos(movDirection) * xtravel;
	ymove = ymove * -dsin(movDirection) * ytravel;
	var spin = 0.05;
	if(xtravel != 0 || ytravel != 0)
	{
		var diff = angle_difference(image_angle, movDirection)
	    if(abs(diff) < spin)
	    {
	        image_angle = movDirection
	    }
	    else
	    {
	        image_angle -= (diff * spin)
	    }
		current_movement_x += xmove;
		current_movement_y += ymove;
	}
	else
	{
		movDirection = point_direction(0, 0, current_movement_x, current_movement_y)
		var diff = angle_difference(image_angle, movDirection)
	    if(abs(diff) < spin)
	    {
	        image_angle = movDirection
	    }
	    else
	    {
	        image_angle -= (diff * spin)
	    }
		current_movement_x = current_movement_x * 0.95;
		current_movement_y = current_movement_y * 0.95;
	}
	
	var magnitude = sqrt(sqr(current_movement_x) + sqr(current_movement_y))
	if(magnitude > MAX_MOMENTUM)
	{
		current_movement_x = (current_movement_x / magnitude) * MAX_MOMENTUM;
		current_movement_y = (current_movement_y / magnitude) * MAX_MOMENTUM;
	}

	x += current_movement_x;
	y += current_movement_y;
}










