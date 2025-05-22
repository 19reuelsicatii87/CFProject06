component accessors="true" singleton {

	/*********************************************************************************************/
	/** DI **/
	/*********************************************************************************************/

	property name="populator" 	inject="wirebox:populator";
	property name="wirebox"   	inject="wirebox";
	property name="user" 		inject="models.Users.user";



	/*********************************************************************************************/
	/** Static Settings **/
	/*********************************************************************************************/

	static {
		hashAlgorithm = "SHA-512";
		hashIterations = 5;
	}

	/**
	 * Constructor
	 */
	function init(){
		return this;
	}

	/**
	 * Verify if the incoming username and password are valid credentials in this user storage
	 *
	 * @username The username to test
	 * @password The password to test
	 *
	 * @return true if valid, else false
	 */
	any function isValidCredentials( required username, required password ){

		var oUser = retrieveUserByUsername( arguments.username,  arguments.password);

		// writeDump(oUser);
		// abort;

		// check if user exist by validating 
		// id is NOT NULL and id length is NOT NULL
		if ( !oUser.isLoaded()) {			
			return false;			
		} else {
			return true;
		}

	
	}

	
	/**
	 * Get a user by username
	 *
	 * @username The username to get the user with
	 *
	 * @return The valid user object representing the username or an empty user object
	 */
	function retrieveUserByUsername( required username, required password ){

        // Query the database for the user by username
        var userData = queryExecute(
            "SELECT * FROM users WHERE username = :username AND password = :password",
            { username: arguments.username,  password: arguments.password},
            { returnType: "array", datasource: "localdbvoge" }
        );

        // Check if userData has any results
        if (userData.isEmpty()) {
            // Return an empty/unloaded User object
            return User.init();
        }

        // Populate and return a User object using the first result
        return User.init()
            .setId(userData[1].id)
            .setFirstName(userData[1].firstName)
            .setLastName(userData[1].lastName)
            .setUsername(userData[1].username)
            .setPassword(userData[1].password)
            .setRoles(userData[1].roles)
            .setPermissions(userData[1].permissions);
    	
	}

	
/**
	 * Get a new user by id
	 *
	 * @id The id to get the user with
	 *
	 * @return The located user or a new un-loaded user object
	 */
	function retrieveUserById( required id ){


		// Query the database for the user by username
        var userData = queryExecute(
            "SELECT * FROM users WHERE id = :id",
            { id: arguments.id },
            { returnType: "array", datasource: "localdbvoge" }
        );

        // Check if userData has any results
        if (userData.isEmpty()) {
            // Return an empty/unloaded User object
            return User.init();
        }

        // Populate and return a User object using the first result
        return User.init()
            .setId(userData[1].id)
            .setFirstName(userData[1].firstName)
            .setLastName(userData[1].lastName)
            .setUsername(userData[1].username)
            .setPassword(userData[1].password)
            .setRoles(userData[1].roles)
            .setPermissions(userData[1].permissions);

	}

}
