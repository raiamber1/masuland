package com.masuland.loginexample
{
	import com.masuland.loginexample.business.AppMockDelegate;
	import com.masuland.loginexample.action.AppController;
	import com.masuland.loginexample.action.event.AppEvent;
	import com.masuland.loginexample.view.AppView;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IOErrorEvent;
	
	import mx.controls.Alert;
	import mx.core.Application;
	import mx.core.IMXMLObject;
	import mx.events.FlexEvent;
	
	import org.springextensions.actionscript.context.support.FlexXMLApplicationContext;
	import org.springextensions.actionscript.core.event.EventBus;
	import org.springextensions.actionscript.ioc.factory.config.EventHandlerMetadataProcessor;
	import org.springextensions.actionscript.ioc.factory.config.RouteEventsMetaDataProcessor;
	import org.springextensions.actionscript.stage.DefaultAutowiringStageProcessor;

	/**
	 * @author masuland.com
	 */
	public class AppConfig extends EventDispatcher implements IMXMLObject
	{
		// Force inclusion of classes not referenced elsewhere in the code
		{
			AppController, AppMockDelegate, EventHandlerMetadataProcessor, DefaultAutowiringStageProcessor, RouteEventsMetaDataProcessor;
		}
		
		public var applicationContext:FlexXMLApplicationContext;
		private var component:Application;
		
		public function initialized(document:Object, id:String) : void
		{
			component = document as Application;
			
			if (component)
			{
				component.addEventListener(FlexEvent.INITIALIZE, createContext);
			}
			else
			{
				throw new Error('The config should be included in the Application class.');
			}
		}
			
		private function createContext(event:FlexEvent) : void
		{
			applicationContext = new FlexXMLApplicationContext();
			applicationContext.addConfigLocation('application-config.xml');
			applicationContext.addEventListener(Event.COMPLETE, applicationContext_completeHandler);
			applicationContext.addEventListener(IOErrorEvent.IO_ERROR, applicationContext_ioErrorHandler);
			applicationContext.load();
		}
		
		private function applicationContext_completeHandler(event:Event) : void 
		{
			EventBus.dispatchEvent(new AppEvent(AppEvent.INIT_APP));
		}
		
		private function applicationContext_ioErrorHandler(event:IOErrorEvent) : void 
		{
			Alert.show('An error occurred when loading the xml for the application context: "' + event.text + '"', 'Error Loading Application Context');
		}
	}
}