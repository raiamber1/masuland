package com.masuland.loginexample.infrastructure.business
{
	import com.masuland.loginexample.data.vo.AuthenticationVO;
	import com.masuland.loginexample.data.vo.UserVO;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.remoting.mxml.RemoteObject;
	
	/**
	 * @author masuland.com
	 */
	public class AppAmfDelegate implements IAppDelegate
	{
		//----------------------
		// Properties
		//----------------------
		
		[Inject]
		public var appRemoteObject:RemoteObject;
		
		//----------------------
		// Methods
		//----------------------
		
		public function getSettings():AsyncToken
		{
			return appRemoteObject.getStyles.send();
		}
		
		public function login(auth:AuthenticationVO):AsyncToken
		{
			return appRemoteObject.login.send(auth);
		}
		
		public function register(auth:AuthenticationVO):AsyncToken
		{
			return appRemoteObject.register.send(auth);
		}
		
		public function updateUser(user:UserVO):AsyncToken
		{
			return appRemoteObject.updateUser.send(user);
		}
	}
}
