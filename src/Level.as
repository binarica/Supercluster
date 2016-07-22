package  
{	
	import flash.display.MovieClip;

	public class Level
	{
		public var background:MC_BG = new MC_BG();	
		public var map:MC_Level = new MC_Level();
		
		public var platformsArray:Vector.<MovieClip> = new Vector.<MovieClip>();
		
		public var speed:int = 8;
		
		public var ID:int;
		
		public function Level()
		{

		}		
		
		public function init(pID:int):void
		{		
			ID = pID;
			background.gotoAndStop(ID);	
			Main.mainStage.addChild(background);
			
			map.gotoAndStop(ID);
			
			map.scaleX = map.scaleY = 2;
			map.y = Main.mainStage.stageHeight - 150;
			map.rotationX = -90;
			Main.mainStage.addChild(map);	
		}		
		
		public function createLevel():void
		{
			for(var i:int=0; i<map.numChildren; i++)
			{
				if(map.getChildAt(i).name == "MC_Platform")
				{
					platformsArray.push( map.getChildAt(i) );
				}
			}
		}
		
		public function movePlatforms(h:MainChar):void
		{
			map.z -= speed;
			
			if(platformsArray != null)
			{
				for(var i:int = 0; i < platformsArray.length; i++)
		 		{
					if((platformsArray[i].z - h.model.z < 150) &&  h.model.hitTestObject( platformsArray[i] ))
					{ 
						h.refreshJump();
					}
					
				}
			}
			
			/*
			if(platformsArray != null)
			{
			for(var i:int = 0; i < platformsArray.length; i++)
			{
			if (platformsMoving)
			platformsArray[i].y += 50;
			
			if(platformsArray[i].y > Main.mainStage.stageHeight)
			{
			platformsArray[i] = null;
			//Main.level.model.removeChild(aux);
			platformsArray.splice(i, 1);
			
			i--;
			}
			*/
			
		}
		
	}
}