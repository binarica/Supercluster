package
{
	public class Bullet
	{
		public var model:MC_Bullet;
		public var speed:Number = 35;
		public var damage:Number = 10;
		
		public function Bullet()
		{
			
		}
		
		public function spawn(posX:Number, posY:Number):void
		{
			model = new MC_Bullet();
			Main.mainStage.addChild(model);
			model.x = posX;
			model.y = posY;
			model.scaleX = 0.5;
			model.scaleY = 0.5;
		}
		
		public function update():void
		{
			move();
		}
		
		public function move():void
		{
			model.z += speed;
			
			if(model.z > 3500)
			{
				destroy();
			}
		}
		
		public function destroy():void
		{
			Main.mainStage.removeChild(model);
			Game.bullets.splice(Game.bullets.indexOf(this) , 1);
		}
	}
}