/**
 * I am a new handler
 * Implicit Functions: preHandler, postHandler, aroundHandler, onMissingAction, onError, onInvalidHTTPMethod
 */
component extends="coldbox.system.EventHandler" {

	// Wirebox - ContactService injection
	property name="contactService" inject="models.Contacts.ContactService";

	this.prehandler_only      = "";
	this.prehandler_except    = "";
	this.posthandler_only     = "";
	this.posthandler_except   = "";
	this.aroundHandler_only   = "";
	this.aroundHandler_except = "";
	this.allowedMethods       = {};



	/**
	 * Display a listing of the resource
	 */
	function index( event, rc, prc ){
		prc.aContacts  = contactService.getAll();
		prc.dbContacts = contactService.getAllDB();
		event.setView( "contacts/index" );
		event.setLayout( "main2" );
	}

}

