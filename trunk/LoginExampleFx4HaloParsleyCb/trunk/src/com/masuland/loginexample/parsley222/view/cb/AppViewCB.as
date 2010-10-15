package com.masuland.loginexample.parsley222.view.cb
{
	import com.masuland.loginexample.parsley222.control.event.AppEvent;
	import com.masuland.loginexample.parsley222.control.event.LoadLayoutEvent;
	import com.masuland.loginexample.parsley222.control.event.LoadLocaleEvent;
	import com.masuland.loginexample.parsley222.control.event.LoadStyleEvent;
	import com.masuland.loginexample.parsley222.vo.LayoutVO;
	import com.masuland.loginexample.parsley222.vo.LocaleVO;
	import com.masuland.loginexample.parsley222.vo.StyleVO;

	public class AppViewCB
	{
		[MessageDispatcher]
		public var dispatcher:Function;

		public function loadStyle(style:StyleVO):void
		{
			dispatcher(new LoadStyleEvent(style));
		}
		
		public function loadLayout(layout:LayoutVO):void
		{
			dispatcher(new LoadLayoutEvent(layout));
		}
		
		public function loadLocale(locale:LocaleVO):void
		{
			dispatcher(new LoadLocaleEvent(locale));
		}
	}
}