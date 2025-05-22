component extends="coldbox.system.EventHandler" {

	/**
	 * Default Action
	 */
	function index( event, rc, prc ){


        // should force the browser to prompt for credentials.
        // ====================================================================
        // var authService = getInstance( "authenticationService@cbSecurity" );

        // if ( !authService.isLoggedIn() ) {
        //     event.setHTTPHeader( name="WWW-Authenticate", value="Basic realm=""Secured Area""" );
        //     event.setHTTPHeader( statusCode=401, statusText="Unauthorized" );
        //     event.noRender();
        // }

        // event.renderData( type="json", data={ message="Welcome to the secured API" } );

        return "You're access is granted by Weng!"; 

    }
}