component singleton accessors = "true"
{

    /**
     * Constructor
     */
    
    ContactDAO function init()
    {
    
        return this;
    }
    
    query function getAllDB()
    {
        var sql = "SELECT * FROM contacts";        
        return queryExecute(sql, {}, { datasource = "localdbjsoncontacts" });

        // result = queryExecute(sql, {}, { datasource = "localdb" });
        // writeDump(result); abort;
    }
    
}