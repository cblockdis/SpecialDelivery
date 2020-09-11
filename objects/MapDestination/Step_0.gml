if (instance_exists(PlayerShipObject))
	{
		with(PlayerShipObject)
		{
			if (point_in_circle(x, y, other.x, other.y, other.sprite_width / 2) && keyboard_check_pressed(vk_enter))
			{
				hascontrol = false;
				global.destination = other.roomId;
				FadeTransition(TRANS_MODE.GOTO, PlayerShip, 705, 530);	
			}
		}
	}

if (instance_exists(PlayerObject))
{
	PlayerObject.hascontrol = false;
}