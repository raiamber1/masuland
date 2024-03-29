package com.masuland.loginexample.action.command
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.masuland.loginexample.data.AppModel;
	import com.masuland.loginexample.data.state.LoginBoxState;
	
	/**
	 * @author masuland.com
	 */
	public class GotoLoginCommand implements ICommand
	{
		//----------------------
		// Methods
		//----------------------
		
		public function execute(event:CairngormEvent):void
		{
			var appModel:AppModel = AppModel.getInstance();
			appModel.loginBoxState = LoginBoxState.LOGIN;
		}
	}
}