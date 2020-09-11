/// @description Fade to black, then back out.

if (transMode != TRANS_MODE.OFF)
{
	if (percent == 1 && transMode == TRANS_MODE.INTRO && initialized)
	{					
		if (instance_exists(PlayerObject))
		{
			with(PlayerObject)
			{
				if (other.transXPos != -1)
					x = other.transXPos;
							
				if (other.transYPos != -1)
					y = other.transYPos;
			}
			
			with (CameraMain)
			{
				x = PlayerObject.x;
				y = PlayerObject.y;
			}
		}					
	}
	
	if (transMode == TRANS_MODE.INTRO)
	{
		percent = max(0, percent - max((percent / 10), 0.005));
		show_debug_message(percent);
	}
	else
	{
		percent = min(1, percent + max(((1 - percent) / 10), 0.005));
		show_debug_message(percent);
	}
	
	if (percent == 1) || (percent == 0)
	{
		switch (transMode)
		{
			case TRANS_MODE.INTRO:
			{				
				initialized = true;
				transMode = TRANS_MODE.OFF;
				break;
			}
			case TRANS_MODE.NEXT:
			{
				transMode = TRANS_MODE.INTRO;
				room_goto_next();
				break;
			}
			case TRANS_MODE.GOTO:
			{
				transMode = TRANS_MODE.INTRO;
				
				if (transTarget == undefined)
					transTarget = PlayerShip;
					
				room_goto(transTarget);

				break;
			}
			case TRANS_MODE.RESTART:
			{
				game_restart();
				break;
			}
			case TRANS_MODE.QUIT:
			{
				game_end();
				break;
			}
		}
	}
}