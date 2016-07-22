package
{
	public class Tile
	{
		public var aux:MC_Platform;
		public var ID:int;
		public var speed:int = 35;
		public var colisionable:Boolean;
		
		public function Tile( pID:int )
		{	
			ID = pID;
		}
		
		public function getPlatforms():void
		{
			aux = new MC_Platform();
				
			aux.x = Main.random(0, Main.mainStage.stageWidth);
			aux.y = Main.mainStage.stageHeight * 0.85;
			aux.z = 5000;
			
			aux.rotationX = -90;
		
			aux.gotoAndStop(ID);
			
			Main.level.model.addChild(aux);
			
			switch (ID)
			{
				case 1:
				case 6:
				case 9:
				case 10:
				case 11:
				case 14:
				case 15:
					colisionable = false;
					break;
				default:
					colisionable = true;
			}
		}
		
		public function move():void
		{
			aux.z -= speed;					
		}
		
		public function erase():void
		{
			Main.level.model.removeChild(aux);
			aux = null;	
		}
	}
}