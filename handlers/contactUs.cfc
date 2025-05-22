component extends="coldbox.system.EventHandler" {

	// DI
	property name="message" inject="models.Messages.Message";
	property name="messageService" inject="models.Messages.MessageService";


	/**
	 * Default Action
	 */
	function index( event, rc, prc ){

		// default
		event.setLayout( "main" );
		event.setView( "main/contactus" );

	}

	function save( event, rc, prc ){


		// create message object
		if(structKeyExists(rc, "fullname")){

			message.setFullname(rc.fullname);
			message.setEmail(rc.email);
			message.setNumber(rc.number);
			message.setMessage(rc.message);

		}

		// call Message Service
		messageService.save(message);// Your handler logic here
		//abort;

		rc.showModal = message.showModal;
        rc.modalTitle = message.modalTitle;
        rc.modalMessage = message.modalMessage;
		//rc.queryMeta = message.queryMeta;
		


        event.setView(view=false, layout=false);
        event.renderData(type="json", data={"title": rc.modalTitle, "message": rc.modalMessage});
		// event.renderData(type="json", data={success=rc.showModal, message=rc.modalMessage});

		// writeOutput("ContactUs Handler");
		// writeDump(rc);
		// abort;

		//event.setLayout( "main" );
		//event.setView( "main/contactus" );	


	}


	function update( event, rc, prc ){


		// create message object
		if(structKeyExists(rc, "id")){

			message.setId(rc.id);
			message.setFullname(rc.fullname);
			message.setEmail(rc.email);
			message.setNumber(rc.number);
			message.setMessage(rc.message);

		}

		// call Message Service
		messageService.update(message);// Your handler logic here
		//abort;

		rc.showModal = message.showModal;
        rc.modalTitle = message.modalTitle;
        rc.modalMessage = message.modalMessage;
		//rc.queryMeta = message.queryMeta;
		


        event.setView(view=false, layout=false);
        event.renderData(type="json", data={"title": rc.modalTitle, "message": rc.modalMessage});
		// event.renderData(type="json", data={success=rc.showModal, message=rc.modalMessage});

		// writeOutput("ContactUs Handler");
		// writeDump(rc);
		// abort;

		//event.setLayout( "main" );
		//event.setView( "main/contactus" );	


	}

	

	/**
	 * --------------------------------------------------------------------------
	 * Implicit Actions
	 * --------------------------------------------------------------------------
	 * All the implicit actions below MUST be declared in the config/Coldbox.cfc in order to fire.
	 * https://coldbox.ortusbooks.com/getting-started/configuration/coldbox.cfc/configuration-directives/coldbox#implicit-event-settings
	 */

	function onAppInit( event, rc, prc ){
	}

	function onRequestStart( event, rc, prc ){
	}

	function onRequestEnd( event, rc, prc ){
	}

	function onSessionStart( event, rc, prc ){
	}

	function onSessionEnd( event, rc, prc ){
		var sessionScope     = event.getValue( "sessionReference" );
		var applicationScope = event.getValue( "applicationReference" );
	}

	function onException( event, rc, prc ){
		event.setHTTPHeader( statusCode = 500 );
		// Grab Exception From private request collection, placed by ColdBox Exception Handling
		var exception = prc.exception;
		// Place exception handler below:
	}

}
