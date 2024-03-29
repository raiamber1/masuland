package com.masuland.loginexample.view.codebehind
{
	import com.masuland.loginexample.action.event.AppEvent;
	import com.masuland.loginexample.action.event.LoginEvent;
	import com.masuland.loginexample.action.event.RegisterEvent;
	import com.masuland.loginexample.data.AppModel;
	import com.masuland.loginexample.data.state.LoginBoxState;
	import com.masuland.loginexample.data.vo.AuthenticationVO;
	
	import flash.events.EventDispatcher;
	
	import org.springextensions.actionscript.core.event.EventBus;

	public class LoginBoxCB
	{
		//----------------------
		// Properties
		//----------------------
		
		[Bindable]
		public var username:String = '';
		
		[Bindable]
		public var email:String = '';
		
		[Bindable]
		public var password:String = '';
		
		[Bindable]
		public var repeatPassword:String = '';
		
		//----------------------
		// Methods
		//----------------------
		
		public function ctaLoginOrRegister(auth:AuthenticationVO, loginBoxState:String):void
		{
			if (loginBoxState == LoginBoxState.LOGIN)
			{
				login(auth);
				resetForm();
			}
			else if (loginBoxState == LoginBoxState.REGISTER)
			{
				register(auth);
				resetForm();
			}
		}
		
		private function resetForm():void
		{
			username = '';
			email = '';
			password = '';
			repeatPassword = '';
		}
		
		private function login(auth:AuthenticationVO):void
		{
			EventBus.dispatchEvent(new LoginEvent(auth));
		}
		
		private function register(auth:AuthenticationVO):void
		{
			EventBus.dispatchEvent(new RegisterEvent(auth));
		}

		public function gotoLogin():void
		{
			EventBus.dispatchEvent(new AppEvent(AppEvent.GOTO_LOGIN));
		}
		
		public function gotoRegister():void
		{
			EventBus.dispatchEvent(new AppEvent(AppEvent.GOTO_REGISTER));
		}
	}
}