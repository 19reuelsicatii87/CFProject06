/**
 * I am a new handler
 * Implicit Functions: preHandler, postHandler, aroundHandler, onMissingAction, onError, onInvalidHTTPMethod
 */
component extends="coldbox.system.EventHandler"{

	// DI
	property name="message" inject="models.Messages.Message";
	property name="messageService" inject="models.Messages.MessageService";

	/**
	 * Display a listing of the resource
	 */
	function index( event, rc, prc ){

		// call Message Service
		prc.messages = messageService.list();

		

		// writeOutput("Type of " & isQuery(prc.messages));
		// rc.showModal = message.showModal;
		// writeDump(prc.messages);
		// writeOutput(prc.messages.timestamp[5]);
		// abort;

		// default
		event.setLayout( "main" );
		event.setView( "main/messages" );

	}


	function delete( event, rc, prc ){

		// create message object
		if(structKeyExists(rc, "id")){

			message.setId(rc.id);

		}

		// call Message Service
		messageService.delete(message);
		rc.showModal = message.showModal;
        rc.modalTitle = message.modalTitle;
        rc.modalMessage = message.modalMessage;
		

		event.setView(view=false, layout=false);
        event.renderData(type="json", data={"title": rc.modalTitle, "message": rc.modalMessage});

	}

	
	function edit( event, rc, prc ){

		// create message object
		if(structKeyExists(rc, "id")){

			message.setId(rc.id);

		}

		// call Message Service
		prc.message = messageService.get(message);

		//writeDump(prc.message.message);
		//abort;

		event.setLayout( "main" );
		event.setView( "main/message" );

	
	}
	



}

