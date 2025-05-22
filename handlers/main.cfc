component extends="coldbox.system.EventHandler" {


	this.prehandler_only 	= "";
	this.prehandler_except 	= "";
	this.posthandler_only 	= "";
	this.posthandler_except = "";
	this.aroundHandler_only = "";
	this.aroundHandler_except = "";
	this.allowedMethods = {};


	// PreHandler: Runs before every action in this handler
    function preHandler( event, rc, prc ) {

		// writeOutput("<br>");
		// writeOutput("Interceptor: preHandler: " & event.getCurrentEvent());

    }

    // PostHandler: Runs after every action in this handler
    function postHandler( event, rc, prc ) {

		// writeOutput("<br>");
     	// writeOutput("Interceptor: postHandler: " & event.getCurrentEvent());

    }

    // AroundHandler: Wraps every action in this handler
    // function aroundHandler( targetAction, event, rc, prc ) {
    //     writeOutput("<cfoutput>AroundHandler BEFORE action</cfoutput>");
        
    //     // Run the target action
    //     var result = targetAction();

    //     writeOutput("<cfoutput>AroundHandler AFTER action</cfoutput>");
        
    //     return result;
    // }

	/**
	 * Default Action
	 */
	function index( event, rc, prc ){

		// default
		event.setLayout( "main" );
		event.setView( "main/index" );

	}


	function vogeVideo( event, rc, prc ){
		// custom view and layout
		event.setView( "components/videoSparkYourDream" );
		event.setLayout( "main2" );
	}

	function vogeAbout( event, rc, prc ){
		// custom view and layout
		event.setView( "components/about" );
		event.setLayout( "main2" );
	}


	function dummy( event, rc, prc ){
		prc.models = [
			{
				"name"   : "Voge 500R",
				"price"  : "Php 300 000.00",
				"engine" : "LX500216",
				"chasis" : "2342KML4"
			},
			{
				"name"   : "Voge 500AC",
				"price"  : "Php 320 000.00",
				"engine" : "AC500216",
				"chasis" : "2342ACL4"
			}
		]

		// custom view and layout
		event.setView( "components/dummy" );
		event.setLayout( "dummy" );
	}


	// Dummy Page
	function dummy2( event, rc, prc ){

		prc.welcomeMessage = "Welcome to ColdBox says Weng Sicat!";

		// custom view and layout
		event.setView( "main/dummy" );
		event.setLayout( "dummy" );
	}

	

	/**
	 * --------------------------------------------------------------------------
	 * Implicit Actions
	 * --------------------------------------------------------------------------
	 * All the implicit actions below MUST be declared in the config/Coldbox.cfc in order to fire.
	 * https://coldbox.ortusbooks.com/getting-started/configuration/coldbox.cfc/configuration-directives/coldbox#implicit-event-settings
	 */

	function onAppInit( event, rc, prc ){

		// writeOutput("<br>");
     	// writeOutput("Interceptor: onAppInit: Start or Restart App" );

	}

	function onRequestStart( event, rc, prc ){

		// writeOutput("<br>");
     	// writeOutput("Interceptor: onRequestStart: " & event.getCurrentEvent());

	}

	function onRequestEnd( event, rc, prc ){

		// writeOutput("<br>");
     	// writeOutput("Interceptor: onRequestEnd: " & event.getCurrentEvent());

	}

	function onSessionStart( event, rc, prc ){

		// writeOutput("<br>");
     	// writeOutput("Interceptor: onSessionStart: " & event.getCurrentEvent());

	}

	function onSessionEnd( event, rc, prc ){

		var sessionScope     = event.getValue( "sessionReference" );
		var applicationScope = event.getValue( "applicationReference" );

		// writeOutput("<br>");
     	// writeOutput("Interceptor: onSessionEnd: " & event.getCurrentEvent());
	}

	function onException( event, rc, prc ){
	
	// 	// Check if event is available
	// 	if (structKeyExists(arguments, "event") && isObject(event)) {
	// 		event.setHTTPHeader(statusCode=500);
	// 		writeOutput("<cfoutput>An exception occurred (onException)</cfoutput><br>");
	// 	} else {
	// 		writeOutput("<cfoutput>Event object is not available during the exception handling process.</cfoutput><br>");
	// 	}

	// 	// Log or handle the exception
	// 	if (structKeyExists(prc, "exception")) {
	// 		var exception = prc.exception; // Access the exception object
	// 		writeDump(exception); // Log or display the exception for debugging
	// 	} else {
	// 		writeOutput("<cfoutput>No exception object found in prc.</cfoutput><br>");
	// 	}

	}

}
