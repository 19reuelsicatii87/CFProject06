/**
 * I am a new service
 */
component singleton
{

	// Properties - Dependency Injection
    property name = "dao" inject = "ContactDAO";

    // DI
    /**
     * Constructor
     */
    
    ContactService function init()
    {
    
        variables.data = [
				[
					"id" = 1, 
					"name" = "coldbox1",
					"city" = "makati"
				], 
				[
					"id" = 2, 
					"name" = "superman",
					"city" = "malabon"
				], 
				[
					"id" = 3, 
					"name" = "batman",
					"city" = "mayapa"
				]
			];

        return this;
    }


        
	// getAll - localVariable
    function getAll()
    {
		return variables.data;
    }
    


	// getAllDB - localDB
    function getAllDB()
    {
		var q = dao.getAllDB();
        return q;
    }
}