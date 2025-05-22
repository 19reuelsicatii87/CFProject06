component {

    // DI
	// property name="message" inject="models.Messages.Message";

    /**
	 * Constructor
	 */
	DAO function init(){
		
		return this;

	}

    function list() {

        var sql = "SELECT * FROM messages ";        

        try {
        
            // Execute the query
            resultSet = queryExecute(sql, {}, { datasource = "localdbvoge"});
           

            // format timestamp
            resultSetFinal = resultSet;
            for (i = 1; i <= resultSetFinal.recordCount; i++) {

                resultSetFinal.timestamp[i] = replace(resultSetFinal.timestamp[i],"{ts '","");
                resultSetFinal.timestamp[i] = replace(resultSetFinal.timestamp[i],"'}","");			
                
            }

            return resultSetFinal;

        } catch (any e) {

            // Handle any exceptions
            return "An error occurred: " & e.message;
        }

    }

    function getById(required message) {

        var sql = "SELECT * FROM messages WHERE id = :id";

        var params = {
            id: {
                value: message.getId(),
                type: "CF_SQL_INTEGER"
            }
        }
        

        try {        
        
            resultSet = queryExecute(sql, params, { datasource = "localdbvoge"});

            // format timestamp
            resultSetFinal = resultSet;                  
            for (i = 1; i <= resultSetFinal.recordCount; i++) {

                resultSetFinal.timestamp[i] = replace(resultSetFinal.timestamp[i],"{ts '","");
                resultSetFinal.timestamp[i] = replace(resultSetFinal.timestamp[i],"'}","");			
                
            }

            return resultSet;

        } catch (any e) {

            // Handle any exceptions
            return "An error occurred: " & e.message;

        }

    }


    function save(required message) {

        var sql = "INSERT INTO messages (fullname, email, number, message, timestamp)
                    VALUES (:fullname, :email, :number, :message, :timestamp)";

        var params = {
            fullname: {
                value: message.getFullname(),
                type: "varchar"
            },
            email: {
                value: message.getEmail(),
                type: "varchar"
            },
            number: {
                value: message.getNumber(),
                type: "varchar"
            },
            message: {
                value: message.getMessage(),
                type: "varchar"
            },
            timestamp: {
                value: message.getTimestamp(),
                type: "timestamp"
            }
        }
        

        try {
        
        // Execute the query
        queryExecute(sql, params, { datasource = "localdbvoge", result = "queryMeta" });

        //writeOutput("queryMeta")
        //writeDump(queryMeta);
        //abort;

        //message.queryMeta = queryMeta;

            // Check the number of affected rows
            if (queryMeta.recordCount > 0) {

                // Data inserted successfully
                message.showModal = true;
                message.modalTitle = "Success"
                message.modalMessage = "Data inserted successfully.";
        
            } else {

                // No rows were affected
                message.showModal = true;
                message.modalTitle = "Failed"
                message.modalMessage = "Data NOT inserted successfully.";
            }

        } catch (any e) {

            // Handle any exceptions
            message.showModal = true;
            message.modalTitle = "Failed"
            message.modalMessage = "An error exception occurred: Check Logs";
            //message.modalMessage = "An error occurred: " & e.message;

            // errorMessageTemp = Replace(e.message, "'", "",  "ALL");
            // errorMessageFinal = Replace(errorMessageTemp, "... at line 1", "",  "ALL");
            // message.modalMessage = "An error occurred: " & errorMessageFinal;

            //message.modalMessage = "An error occurred: " & Left(e.message, Len(e.message) - 40);
        }

        


    }

    function update(required message) {

        var sql = "UPDATE messages 
                    SET fullname = :fullname, email = :email, number = :number, message = :message, timestamp = :timestamp
                    WHERE id = :id";

        var params = {
            id: {
                value: message.getId(),
                type: "numeric"
            },
            fullname: {
                value: message.getFullname(),
                type: "varchar"
            },
            email: {
                value: message.getEmail(),
                type: "varchar"
            },
            number: {
                value: message.getNumber(),
                type: "varchar"
            },
            message: {
                value: message.getMessage(),
                type: "varchar"
            },
            timestamp: {
                value: message.getTimestamp(),
                type: "timestamp"
            }
        }
        

        try {
        
        // Execute the query
        queryExecute(sql, params, { datasource = "localdbvoge", result = "queryMeta" });

        //writeOutput("queryMeta")
        //writeDump(queryMeta);
        //abort;

        //message.queryMeta = queryMeta;

            // Check the number of affected rows
            if (queryMeta.recordCount > 0) {

                // Data inserted successfully
                message.showModal = true;
                message.modalTitle = "Success"
                message.modalMessage = "Data updated successfully.";
        
            } else {

                // No rows were affected
                message.showModal = true;
                message.modalTitle = "Failed"
                message.modalMessage = "Data NOT updated successfully.";
            }

        } catch (any e) {

            // Handle any exceptions
            message.showModal = true;
            message.modalTitle = "Failed"
            message.modalMessage = "An error exception occurred: " & e.message;
            //message.modalMessage = "An error occurred: " & e.message;

            // errorMessageTemp = Replace(e.message, "'", "",  "ALL");
            // errorMessageFinal = Replace(errorMessageTemp, "... at line 1", "",  "ALL");
            // message.modalMessage = "An error occurred: " & errorMessageFinal;

            //message.modalMessage = "An error occurred: " & Left(e.message, Len(e.message) - 40);
        }

        


    }


    function deleteById(required message) {

        var sql = "DELETE FROM messages WHERE id = :id";

        var params = {
            id: {
                value: message.getId(),
                type: "CF_SQL_INTEGER"
            }
        }
        

        try {
        
        // Execute the query
        queryExecute(sql, params, { datasource = "localdbvoge", result = "queryMeta" });

        //writeOutput("queryMeta")
        //writeDump(queryMeta);
        //abort;

        //message.queryMeta = queryMeta;

            // Check the number of affected rows
            if (queryMeta.recordCount > 0) {

                // Data inserted successfully
                message.showModal = true;
                message.modalTitle = "Success"
                message.modalMessage = "Data deleted successfully.";
        
            } else {

                // No rows were affected
                message.showModal = true;
                message.modalTitle = "Failed"
                message.modalMessage = "Data NOT deleted successfully.";
            }

        } catch (any e) {

            // Handle any exceptions
            message.showModal = true;
            message.modalTitle = "Failed"
            message.modalMessage = "An error exception occurred: Check Logs";

        }

    }

}