package   
{
	import flash.events.*;
	import flash.ui.*;
	import flash.ui.Mouse;
	import flash.utils.clearInterval;
	import flash.utils.setInterval;
	import flash.display.MovieClip;
	
	public class Game
	{
		public static var controllers:Array = new Array();
		
		public static var level:Level;
		
		public static var myNave:MainChar;
		public static var naveShoot:Boolean = false;
	
		public var timerID:uint;
		public var timeLapse:uint = 1250;
		
		public var myAliens:Vector.<Enemy> = new Vector.<Enemy>();
		public static var bullets:Vector.<Bullet> = new Vector.<Bullet>();
		
		
		public var gameOver:MC_KO = new MC_KO();
		
		public var stageSelect:int = 1;
		
		public static var gui:GUI;
		
		
		public function Game()
		{	
			
		}	
			
		public function startGame():void 
		{
			
			level = new Level();
			level.init(stageSelect);
			level.createLevel();
			
			gui = new GUI();
			
			myNave = new MainChar();
			myNave.spawn();
			
			Main.controllers.push ( new UserController(myNave, Keyboard.LEFT, Keyboard.RIGHT, Keyboard.UP, Keyboard.CONTROL, Keyboard.SPACE) );
				
			Main.mainStage.addEventListener(Event.ENTER_FRAME, update);
	
			timerID = setInterval(spawnTimer,timeLapse);
			
		}
	
		
		protected function update(e:Event):void
		{
			var i:int;
			
			if (!myNave.isDead)
			{
				myNave.update();
				gui.update();
				updateBullets();
				
				level.movePlatforms(myNave);
				
				for(i = 0; i < Main.controllers.length; i++)
				{
					Main.controllers[i].update();
				}

				if(myAliens != null)
				{
					for(i = 0; i< myAliens.length; i++)
					{
						var enemyIsDead:Boolean = false;
					
						myAliens[i].move();
						
						if(myAliens[i].model.y > Main.mainStage.stageHeight)
						{
							enemyIsDead = true;
						}
						
						else if((myAliens[i].model.z - myNave.model.z < 150) &&  myNave.model.hitTestObject( myAliens[i].model ))
						{ 
							enemyIsDead = true;
							gui.damage(5);
							myNave.hurt();
						}
					
						if(enemyIsDead)
						{
							myAliens[i].destroy();
							myAliens.splice(i, 1);
						
							i--;
						}
					}
				}
				/*
				if (naveShoot) //se tiene que hacer con una función. sino siempre va a ser rapid fire!!!
				{
					naveShoot = false;
					var numBullets:int = 1;
					for(i = -numBullets/2; i<numBullets/2; i++)
					{
						var b:Bullet = new Bullet();
						b.spawn( myNave.model.x, myNave.model.y - 5 );
						bullets.push(b);
					}					
				}		
				*/
				
				checkCollisions();		
			}
			
			else
			{
				myNave.destroy();
				Main.mainStage.removeEventListener(Event.ENTER_FRAME, update);
				clearInterval(timerID);
				//level.model.filters = [new BlurFilter(25,25)];
				Main.mainStage.addChild(gameOver);
				Main.mainStage.addEventListener(KeyboardEvent.KEY_DOWN, restartGame);
			}
		}
		
		public function updateBullets():void
		{
			for (var i:int = 0; i < bullets.length; i++) 
			{
				bullets[i].update();
			}
			
		}
		
		public function restartGame(event:KeyboardEvent):void
		{
			switch(event.keyCode)
			{
				case Keyboard.R:
					Main.mainStage.removeEventListener(KeyboardEvent.KEY_DOWN, restartGame);
					
					Main.mainStage.removeChild(gameOver);
					myNave.isDead = false;
					
					gui.score = 0;
					gui.life = 100;
					
					startGame();
					
					break;
			}
		}
		
		public function levelComplete():void
		{
			stageSelect++;	
		}
		
		
		public function checkCollisions():void
		{

			for(var i:int = 0; i < bullets.length; i++)
			{
				for(var j:int=0; j < myAliens.length; j++)
				{
					if(bullets[i].model.hitTestObject( myAliens[j].model ))
					{
						gui.addScore(30);
						
						bullets[i].destroy();
						myAliens[j].destroy();
						
						myAliens.splice(j, 1);
						
						i--;
						j = myAliens.length;
					}
				}
			}
		}
		
		
		public function spawnTimer():void
		{
			var enemySwap:Number = Math.random() * 10;
			var e:Enemy; 
			
			if (enemySwap < 7)
			{
				e = new Enemy(1);
			}
			
			else 
			{
				e = new Enemy(2);
			}
			
			e.spawn();
			myAliens.push(e);
		}
		
		
		public static function random (min:int, max:int):int
		{
			var num:int = (Math.random() * (max - min)) + min;
			return num;
		}
	}
}