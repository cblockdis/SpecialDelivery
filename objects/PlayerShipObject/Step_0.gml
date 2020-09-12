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
	var spin = 0.1;
	var diff = angle_difference(image_angle, movDirection)
	if(xtravel != 0 || ytravel != 0)
	{
	    if(abs(diff) < spin)
	    {
	        image_angle = movDirection
	    }
	    else
	    {
	        image_angle -= (diff * spin)
	    }
	}

	x += xmove;
	y += ymove;
}










