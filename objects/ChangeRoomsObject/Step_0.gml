/// @description check for overlap

// Check for confirmation from player object
if (!triggerOnCollision)
{
	if (instance_exists(PlayerObject))
	{
		with(PlayerObject)
		{
			if (point_in_rectangle(x, y, other.bbox_left, other.bbox_top, other.bbox_right, other.bbox_bottom) && keyboard_check_pressed(vk_up))
			{
				hascontrol = false;
				FadeTransition(TRANS_MODE.GOTO, other.roomId, -1, -1);
			}
		}
	}
}