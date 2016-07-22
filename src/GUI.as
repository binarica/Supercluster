package
{
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;

	public class GUI
	{
		//public var model:mc_GUI;
		public var score:int = 0;
		public var life:int = 100;
		
		public var format:TextFormat = new TextFormat();
		public var tb_score:TextField = new TextField();
		public var tb_life:TextField = new TextField();	
		
		public function GUI()
		{
			//model = new mc_GUI();
			//Main.mainStage.addChild(mod);
			
			Main.mainStage.addChild(tb_score);
			Main.mainStage.addChild(tb_life);
			
			
			format.font = "Century Gothic";
			format.size = 24;
			format.color = 0xFFFFFF;
			format.bold = true;
			format.align = TextFormatAlign.LEFT;
			
			tb_score.defaultTextFormat = format;
			
			tb_score.width = 500;
			tb_score.height = 40;
			
			tb_score.x = 20;
			tb_score.y = 20;
			
			tb_score.selectable = false;
			
			tb_life.defaultTextFormat = format;
			
			tb_life.width = 500;
			tb_life.height = 40;
			
			tb_life.x = 20;
			tb_life.y = 40;
			
			tb_life.selectable = false;	
		}
		
		public function update():void
		{
			tb_score.text = "SCORE : " + score;
			tb_life.text = "ENERGY : " + life;
		}
		
		
		public function addScore(s:int):void
		{
			score += s;
			//mod.tb_score.text = score.toString();  
		}
		
		public function damage(count:int):void
		{
			life -= count;
			if(life <= 0)
				Game.myNave.isDead = true;
			//mod.mc_energyBar.gotoAndStop(life);
		}
		
	}
}