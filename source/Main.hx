package;

import flixel.FlxGame;
import openfl.display.Sprite;
#if !html5
//#error "Only HTML5 Supported"
#end
class Main extends Sprite
{
	public function new()
	{
		super();
		addChild(new FlxGame(0, 0, PlayState, 1, 60, 60, true, false));
	}
}
