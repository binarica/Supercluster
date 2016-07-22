package   
{
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.display.StageScaleMode;
	import flash.events.KeyboardEvent;
	import flash.geom.Point;
	import flash.ui.Keyboard;
	import flash.ui.Mouse;

	[SWF(width="1280", height="720", frameRate="60")]
	public class Main extends Sprite
	{		
		public static var mainStage:Stage;

		public static var controllers:Array = new Array();
		
		public var start:MC_Start = new MC_Start();
		
		public var game:Game = new Game();	
		
		public function Main()
		{	
			Mouse.hide();			
			
			mainStage = stage;
			mainStage.scaleMode = StageScaleMode.EXACT_FIT;
			mainStage.transform.perspectiveProjection.projectionCenter = new Point (mainStage.stageWidth/2, mainStage.stageHeight/4);
			
			mainStage.addChild(start);
			mainStage.addEventListener(KeyboardEvent.KEY_DOWN,onKeyDown);
		}
	
		public function onKeyDown(e:KeyboardEvent):void
		{
			switch(e.keyCode)
			{
				case Keyboard.ENTER:
					mainStage.removeChild(start);
					mainStage.removeEventListener(KeyboardEvent.KEY_DOWN,onKeyDown);
					game.startGame();
					break;
			}
		}		

	}
}