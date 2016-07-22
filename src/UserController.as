package
{
	import flash.events.KeyboardEvent;

	public class UserController
	{
		public var objectControlled:MainChar;
		
		public var isLeftPressed:Boolean;
		public var isRightPressed:Boolean;
		public var isUpPressed:Boolean;
		public var isShootPressed:Boolean;
		public var isJumpPressed:Boolean;
		
		public var keyCodeLeft:int;
		public var keyCodeRight:int;
		public var keyCodeUp:int;
		public var keyCodeShoot:int;
		public var keyCodeJump:int;
		
		public function UserController(h:MainChar, keyCodeLeft:int, keyCodeRight:int, keyCodeUp:int, keyCodeShoot:int, keyCodeJump:int)
		{
			objectControlled = h;
			
			this.keyCodeLeft = keyCodeLeft;
			this.keyCodeRight = keyCodeRight;
			this.keyCodeUp = keyCodeUp;
			this.keyCodeShoot = keyCodeShoot;
			this.keyCodeJump = keyCodeJump;
			
			Main.mainStage.addEventListener(KeyboardEvent.KEY_UP, evKeyUp);
			Main.mainStage.addEventListener(KeyboardEvent.KEY_DOWN, evKeyDown);
			
			Main.controllers.push(this);
		}
		
		public function update():void
		{
			checkKeys();
		}
		
		protected function evKeyUp(event:KeyboardEvent):void
		{
			switch(event.keyCode)
			{
				case keyCodeLeft:
					isLeftPressed = false;
					break;
				
				case keyCodeRight:
					isRightPressed = false;
					break;
				
				case keyCodeUp:
					isUpPressed = false;
					break;
				
				case keyCodeShoot:
					isShootPressed = false;
					break;
				
				case keyCodeJump:
					isJumpPressed = false;
					break;
			}
		}
		
		protected function evKeyDown(event:KeyboardEvent):void
		{
			switch(event.keyCode)
			{
				case keyCodeLeft:
					isLeftPressed = true;
					break;
				
				case keyCodeRight:
					isRightPressed = true;
					break;
				
				case keyCodeUp:
					isUpPressed = true;
					break;

				case keyCodeShoot:
					isShootPressed = true;
					break;

				case keyCodeJump:
					isJumpPressed = true;	
					break;
			}
		}
		
		public function checkKeys():void
		{
			if(isLeftPressed)
			{
				objectControlled.move(-1);
			}
			else if(isRightPressed)
			{
				objectControlled.move(1);
			}
			
			if(isUpPressed)
				objectControlled.up();
			
			if(isShootPressed)
			{
				objectControlled.shoot();
			}
			
			if(isJumpPressed)
				objectControlled.jump();

		}
	}
}