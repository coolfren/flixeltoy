package;

import flixel.system.FlxAssets.FlxShader;
import flixel.util.FlxColor;
import flixel.text.FlxText;
#if html5
import js.html.TextAreaElement;
import js.Browser.document;
import js.html.Node;
import js.html.ButtonElement;
import js.Browser;
#end
import flixel.addons.display.FlxRuntimeShader;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;

class PlayState extends FlxState
{
	var image:FlxSprite;
	var error:FlxText;
	override public function create()
	{
		//var openflContent = document.getElementById("openfl-content");
		//document.appendChild(new TextAreaElement());
		error = new FlxText();
		error.text = "Error compiling Shader...";
		error.setBorderStyle(FlxTextBorderStyle.OUTLINE, FlxColor.BLACK, 2);
		error.setFormat("vcr", 32);
		error.alpha = 0;
		image = new FlxSprite(0, 0);
		image.loadGraphic(AssetPaths.bliss__png);
		image.setGraphicSize(FlxG.width, FlxG.height);
		image.screenCenter();
		image.shader = new FlxRuntimeShader(null, null, 110);
		#if html5
		document.getElementById("shaderbtn").onclick = (e) ->
		{
			final shadertext = cast (document.getElementById("shadercode"), TextAreaElement);
			// image.shader = new FlxRuntimeShader(shadertext.value);
			try{
				Reflect.setProperty(image, "shader", new FlxRuntimeShader(shadertext.value));
			}
			catch(e){
				error.alpha = 1;
			}
		};
		#end
		add(image);
		add(error);
		super.create();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
