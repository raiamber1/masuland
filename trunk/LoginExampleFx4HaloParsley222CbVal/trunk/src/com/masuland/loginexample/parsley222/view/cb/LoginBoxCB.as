package com.masuland.loginexample.parsley222.view.cb
{
	import com.masuland.loginexample.parsley222.control.event.AppEvent;
	import com.masuland.loginexample.parsley222.control.event.LoginEvent;
	import com.masuland.loginexample.parsley222.control.event.RegisterEvent;
	import com.masuland.loginexample.parsley222.model.AppModel;
	import com.masuland.loginexample.parsley222.state.LoginBoxState;
	import com.masuland.loginexample.parsley222.vo.AuthenticationVO;

	public class LoginBoxCB
	{
		[Inject]
		[Bindable]
		public var appModel:AppModel;
		
		[Bindable]
		public var username:String = '';
		
		[Bindable]
		public var email:String = '';
		
		[Bindable]
		public var password:String = '';
		
		[Bindable]
		public var repeatPassword:String = '';
		
		[Bindable]
		public var validatorGroup:LoginBoxValidatorGroup = new LoginBoxValidatorGroup();
		
		[MessageDispatcher]
		public var dispatcher:Function;
		
		public function LoginBoxCB()
		{
			validatorGroup.cb = this;
			validatorGroup.initialized(this, "LoginBoxCB");
			validatorGroup.validate(true);
		}
		
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
			
			validatorGroup.reset();
		}
		
		private function login(auth:AuthenticationVO):void
		{
			dispatcher(new LoginEvent(auth));
		}
		
		private function register(auth:AuthenticationVO):void
		{
			dispatcher(new RegisterEvent(auth));
		}

		public function gotoLogin():void
		{
			dispatcher(new AppEvent(AppEvent.GOTO_LOGIN));
		}
		
		public function gotoRegister():void
		{
			dispatcher(new AppEvent(AppEvent.GOTO_REGISTER));
		}
	}
}