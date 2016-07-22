package
{
	public class Enemy
	{
		public var model:MC_Alien;

		public var speed:Array = [50,80];
		
		public var ID:int;
		
		public var scale:Number = 1;
		
		public var isDead:Boolean;
		
		public function Enemy(pID:int)
		{
			ID = pID;
		}
		
		public function spawn():void
		{
			model = new MC_Alien();
		
			model.x = Math.random() * Main.mainStage.stageWidth;
			model.y = Main.mainStage.stageHeight - model.height;
			model.z = 5000;
			
			model.scaleX = model.scaleY = 0;
			
			model.gotoAndStop(ID);
			
			Main.mainStage.addChild(model);
		}
		
		
		public function destroy():void
		{
			//changeAnimation("explode");
			Main.mainStage.removeChild(model);
			model = null;
			
			isDead = true;
			Game.gui.addScore(10);	
		}

		
		public function move():void
		{
			if (model.scaleX < scale)
				model.scaleX = model.scaleY += 0.05;	
			else
				model.z -= speed[ID-1];
		}
		
		public function changeAnimation(name:String):void
		{
			if(model.currentLabel != name)
			{
				model.gotoAndPlay(name);
			}
		}
	}
}