/// @description Ship Movement Logic

keybUp = keyboard_check(vk_up);
keybDown = keyboard_check(vk_down);
keybRight = keyboard_check(vk_right);
keybLeft = keyboard_check(vk_left);

movingY = (keybUp || keybDown ? true : false);
movingX = (keybRight || keybLeft ? true : false);

if (keybUp)
{
	if (yDirection >= 0)
	{
		isRotating = true;
		speedYShift = 0;
		yDirection = -1;
	}
}

if (keybDown)
{
	if (yDirection <= 0)
	{
		isRotating = true;
		speedYShift = 0;
		yDirection = 1;
	}
}

if (keybRight) 
{
	if (xDirection <= 0)
	{
		isRotating = 0;
		speedXShift = 0;
		xDirection = 1;
	}
}

if (keybLeft)
{
	if (xDirection >= 0)
	{
		isRotating = 0;
		speedXShift = 0;
		xDirection = -1;
	}
}

if (yDirection != 0)
{
	if (speedYShift < 1 && movingY)
		speedYShift += .03;
	else
		if (speedYShift > 0)
			speedYShift -= .01;
		else 
		{
			speedYShift = 0;
			yDirection = 0;
		}
}

if (xDirection != 0)
{
	if (speedXShift < 1 && movingX)
		speedXShift += .03;
	else
		if (speedXShift > 0)
			speedXShift -= .01;
		else 
		{
			speedXShift = 0;
			xDirection = 0;
		}
}
var xmove = (MOVE_SPEED * speedXShift) * sign(xDirection);
var ymove = (MOVE_SPEED * speedYShift) * sign(yDirection);
var momDirection = point_direction(0,0,xmove,ymove);
var spin = 3;
var diff = ((momDirection + 360) - image_angle) % 360;
if(image_angle != pointDirection)
{
    if(diff < spin)
    {
        image_angle = pointDirection
    }
    else
    {
        if(diff > 180)
        {
            image_angle = image_angle - spin;
        }
        else
        {
            image_angle = image_angle + spin;
        }
        image_angle = image_angle % 360;
    }
}
/*
xTo = x + (MOVE_SPEED * speedXShift) * sign(xDirection);
yTo = y + (MOVE_SPEED * speedYShift) * sign(yDirection);

if (speedXShift != 0 || speedYShift != 0)
{
	image_angle = point_direction(x, y, xTo, yTo);
}*/
	
x += (MOVE_SPEED * speedXShift) * sign(xDirection);
y += (MOVE_SPEED * speedYShift) * sign(yDirection);










