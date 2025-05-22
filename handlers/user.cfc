/**
 * I am a new handler
 * Implicit Functions: preHandler, postHandler, 
 * aroundHandler, onMissingAction, onError, onInvalidHTTPMethod
 */
component extends="coldbox.system.EventHandler"{

	this.prehandler_only 	= "";
	this.prehandler_except 	= "";
	this.posthandler_only 	= "";
	this.posthandler_except = "";
	this.aroundHandler_only = "";
	this.aroundHandler_except = "";
	this.allowedMethods = {};

	// Property - Dependency Injection (User Defined)
	property name="dummyServiceContact" inject="DummyService@Contact";
	property name="dummyServiceUser" inject="DummyService@User";

	// Property - Dependency Injection (Coldbox Defined)
	property name="configSettings" inject="coldbox:configSettings";
	property name="coldboxSettings" inject="coldbox:coldboxSettings";

	/**
	 * Display a listing of the resource
	 */
	function index( event, rc, prc ){

		prc.contactRenderService = dummyServiceContact.renderService();
		prc.userRenderService = dummyServiceUser.renderService();

		prc.coldboxSettingsColdbox = serializeJSON(coldboxSettings.coldbox);
		prc.coldboxSettingsAppName = coldboxSettings.coldbox.appName;

		prc.customSetting =  configSettings.dummySetting;
		prc.customSettingVersion =  configSettings.dummySettingVersion;


	}
}

