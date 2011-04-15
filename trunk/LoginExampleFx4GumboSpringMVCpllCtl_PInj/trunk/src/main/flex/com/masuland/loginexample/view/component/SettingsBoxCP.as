package com.masuland.loginexample.view.component
{
	import com.masuland.loginexample.control.event.LoadLayoutEvent;
	import com.masuland.loginexample.control.event.LoadLocaleEvent;
	import com.masuland.loginexample.control.event.LoadStyleEvent;
	import com.masuland.loginexample.model.AppModel;
	import com.masuland.loginexample.state.SettingsBoxState;
	import com.masuland.loginexample.vo.LayoutVO;
	import com.masuland.loginexample.vo.LocaleVO;
	import com.masuland.loginexample.vo.SettingsVO;
	import com.masuland.loginexample.vo.StyleVO;
	
	import flash.events.MouseEvent;
	
	import mx.automation.IAutomationObject;
	
	import org.springextensions.actionscript.core.event.EventBus;
	
	import spark.components.Button;
	import spark.components.supportClasses.SkinnableComponent;

	[SkinState('closed')]
	[SkinState('open')]
	public class SettingsBoxCP extends SkinnableComponent
	{
		[SkinPart(required='true')]
		public var btn_settings:Button;
		
		//----------------------
		// Properties
		//----------------------
		
		[Inject]
		[Bindable]
		public var appModel:AppModel;

		[Inject(name='appModel', property='settings')]
		[Bindable]
		public var settings:SettingsVO;
		
		private var _settingsBoxState:String;
		
		//----------------------
		// Getter / Setter
		//----------------------

		[Inject(name='appModel', property='settingsBoxState')]
		[Bindable]
		public function get settingsBoxState():String
		{
			return _settingsBoxState;
		}
		
		public function set settingsBoxState(value:String):void
		{
			_settingsBoxState = value;
			
			invalidateSkinState();
		}

		//----------------------
		// Methods
		//----------------------
		
		override protected function getCurrentSkinState():String
		{
			return _settingsBoxState;
		} 
		
		public function loadStyle(style:StyleVO):void
		{
			EventBus.dispatchEvent(new LoadStyleEvent(style));
		}
		
		public function loadLayout(layout:LayoutVO):void
		{
			EventBus.dispatchEvent(new LoadLayoutEvent(layout));
		}
		
		public function loadLocale(locale:LocaleVO):void
		{
			EventBus.dispatchEvent(new LoadLocaleEvent(locale));
		}
		
		//----------------------
		// Handler
		//----------------------
		
		public function btn_settings_clickHandler(event:MouseEvent):void
		{
			if (appModel.settingsBoxState == SettingsBoxState.CLOSED)
			{
				appModel.settingsBoxState = SettingsBoxState.OPEN;
			}
			else
			{
				appModel.settingsBoxState = SettingsBoxState.CLOSED;
			}
		}
	}
}