/// @description Switch rooms
if (instance_exists(PlayerObject) && triggerOnCollision)
{
	with (PlayerObject)
	{
		if (hascontrol)
		{
			hascontrol = false;
			FadeTransition(TRANS_MODE.GOTO, other.roomId, other.setXPosition, other.setYPosition);
		}
	}
}
