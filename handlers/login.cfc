/**
 * I am a new handler
 * Implicit Functions: preHandler, postHandler, aroundHandler, onMissingAction, onError, onInvalidHTTPMethod
 */
component extends="coldbox.system.EventHandler"{

	this.prehandler_only 	= "";
	this.prehandler_except 	= "";
	this.posthandler_only 	= "";
	this.posthandler_except = "";
	this.aroundHandler_only = "";
	this.aroundHandler_except = "";
	this.allowedMethods = {};


	function index( event, rc, prc ){

		event.setLayout( "main" );
		event.setView( "login/index" );
		
    }

	function notAuthenticated( event, rc, prc ){
		
		event.setLayout( "main" );
        event.setView( "login/notAuthenticated" );
		
		
    }

	function notAuthorized( event, rc, prc ){

		
		event.setLayout( "main" );
        event.setView( "login/notAuthorized" );
		
    }


	function jwtLogin( event, rc, prc ){
		try {
 
	
            var token = jwtAuth().attempt( rc.username, rc.password );

			var payload = jwtAuth().parseToken(
				token         : token,
				storeInContext: false,
				authenticate  : false
			);

 	
            return {
                "error"     : false,
                "data"      : token,
				"token_exp" : payload.exp,
                "message"   : "Bearer token created and it expires in #jwtAuth().getSettings().jwt.expiration# minutes"
            };

        } catch ( "InvalidCredentials" e ) {


            event.setHTTPHeader( statusCode = 401, statusText = "Unauthorized" );

            return { 
				"error" : true, 
				"data" : {}, 
				"message" : "Invalid Credentials" 
			};
			
        }
	}


	/**
	 * doLogin
	 */
	function doLogin( event, rc, prc ){

		try {

			var oUser = cbsecure().authenticate( rc.username ?: "", rc.password ?: "" );
			//return "You are logged in!";

		

			flash.put( "message", "You are logged in!" );

			return prc.oCurrentUser.getUsername();
			writeDump(prc.oCurrentUser);
			abort;

			relocate( "messages/index" );


		} catch ( "InvalidCredentials" e ) {

			flash.put( "message", "Invalid credentials, try again! " & e.message);
			relocate( "login/index" );

		}

	}

	/**
	 * doLogout
	 */
	function doLogout( event, rc, prc ){

		cbsecure().logout();
		flash.put( "message", "Bye bye!" );
		relocate( "login/index" );
    

	}



}

