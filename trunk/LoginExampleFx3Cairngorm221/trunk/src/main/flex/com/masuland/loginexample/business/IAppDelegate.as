package com.masuland.loginexample.business
{
	import com.masuland.loginexample.vo.AuthenticationVO;
	import com.masuland.loginexample.vo.UserVO;

	public interface IAppDelegate
	{
		/**
		 * getSettings()
		 * 
		 * @return SettingsVO
		 */
		function getSettings():void;
		
		/**
		 * login()
		 * 
		 * @param auth
		 * @return UserVO
		 */
		function login(auth:AuthenticationVO):void;
		
		/**
		 * register()
		 * 
		 * @param auth
		 * @return UserVO
		 */
		function register(auth:AuthenticationVO):void;
		
		/**
		 * updateUser()
		 * 
		 * @param user
		 * @return UserVO
		 */
		function updateUser(user:UserVO):void;
	}
}