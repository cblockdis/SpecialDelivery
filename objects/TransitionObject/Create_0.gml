/// @description Initialize transition object
enum TRANS_MODE
{
	OFF,
	NEXT,
	GOTO,
	RESTART,
	INTRO,
	QUIT
}

transMode = TRANS_MODE.INTRO;
transTarget = room;
transXPos = -1;
transYPos = -1;
percent = 1;
initialized = false;