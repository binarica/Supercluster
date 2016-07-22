package
{
	public class MainChar
	{
		public var model:MC_Nave;
		public var life:int = 100;
		public var isDead:Boolean = false;
		
		public var scale:Number = 1;
		public var isLocked:Boolean = false;
		
		public var ammoTotal:int = 5;
		public var ammoCurrent:int = ammoTotal;
		
		public var startForce:Number = 15;
		public var currentForce:Number = 0;
		public var gravity:Number = 0.3;
		public var floor:Number = Main.mainStage.stageHeight;
		
		public var numBullets:int = 1; // hacer opcion de rapidfire
		
		public function MainChar()
		{
		
		}
		
		public function spawn():void
		{
			
			model = new MC_Nave();
			
			model.scaleX = model.scaleY = scale;
			
			model.x = Main.mainStage.stageWidth / 2;
			model.y = Main.mainStage.stageHeight / 2;
		
		}
		
		public function update():void
		{
			Main.mainStage.addChild(model);
			
			model.y -= currentForce;
			currentForce -= gravity;
			
			if(model.y >= floor + model.height)
				isDead = true;
		}
		
		
		public function shoot():void
		{/*
			for(var i:int = -numBullets/2; i<numBullets/2; i++)
			{*/
				var b:Bullet = new Bullet();
				b.spawn( model.x, model.y - 5 );
				Game.bullets.push(b);
		/*	}	*/			
		}
		
		public function move(direction:int):void
		{
			switch (direction)
			{
				case 1:
					model.x += (Main.mainStage.stageWidth - model.x) / 50;
					if (model.rotationZ > -45)
						model.rotationZ --;
					break;
				case -1:
					model.x -= (0 + model.x) / 50;
					if (model.rotationZ < 45)
						model.rotationZ ++;
					break;
			}	
		}
		
		public function up():void
		{
			model.z += 1;
			//Main.platformsMoving = true;
		}
		
		public function jump():void
			
		{
			if (!isLocked)
			{
				currentForce = startForce;
				model.y -= currentForce;
				isLocked = true;
			}
		}
		
		public function refreshJump():void
		{
			if (model.y >= floor - model.height)
			{
				model.y = floor - model.height;
				isLocked = false;
			}
		}
		
		public function hurt():void
		{
			Game.gui.damage(10);
			//isDead = true;			
		}
				
		public function destroy():void
		{
			isDead = true;
			Main.mainStage.removeChild(model);
		}
	}
}