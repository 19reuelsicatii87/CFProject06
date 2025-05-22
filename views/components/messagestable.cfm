<cfoutput>

    <!---div class="container">
        <div class="my-5">

            <h1>Received</h1>
            #html.table( 
                    data=prc.messages, 
                    class="table table-striped"
                )#

        </div>
    </div--->

    <!--- Messages Table --->
    <div class="container">
        <div class="my-5">
            <cfif flash.exists( "message" )>
                <div style="border: 1px solid gray; background-color: ##8fce00; margin: 20px 0px; padding: 10px">
                    #flash.get( "message" )#
                </div>
            </cfif>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th class="">ID</th>
                        <th class="col-1">Fullname</th>
                        <th class="">Email</th>
                        <th class="">Number</th>
                        <th class="">Message</th>
                        <th class="col-1">Actions</th>
                    </tr>
                </thead>
                <tbody>

                    <!--- Sample loop through records --->
                    <cfloop query=#prc.messages#>
                        <tr>
                            <td class="text-center">#id#</td>
                            <td>#fullname#</td>
                            <td>#email#</td>
                            <td>#number#</td>
                            <td>#message#</td>
                            <td>
                                <a class="mx-1 text-decoration-none" href='#event.buildLink( "messages/edit/#id#" )#'>
                                    <i class="bi bi-pencil-fill"></i>
                                </a>
                                <a class="mx-1">
                                    <i class="bi bi-trash-fill mx-1 delete-icon" data-id="#id#"></i>
                                </a>
                      
                                
                                
                            </td>
                        </tr>
                    </cfloop>

                </tbody>
            </table>
        </div>
    </div>

    <!--- Delete Modal --->
	<div class="modal fade" id="deleteConfirmationModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
			<div class="modal-header">
				<h1 class="modal-title fs-5" id="modalTitle">Delete Confirmation</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body" id="modalBody">
                Are you sure you want to delete this record?
			</div>
			<div class="modal-footer">
                <button id="confirmDeleteBtn" type="button" class="btn btn-primary">OK</button>
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
			</div>
			</div>
		</div>
	</div>


    <script>

        // Function to show delete message confirmaion
        document.addEventListener('click', function (event) {

            // Check if the clicked element has the class 'delete-icon'
            if (event.target.matches('.delete-icon')) {

                 // Get and store the ID from data attribute
                selectedId = event.target.getAttribute('data-id');
                console.log("Selected ID for deletion:", selectedId);

                var modal = new bootstrap.Modal(document.getElementById('deleteConfirmationModal'), {
                    keyboard: true
                });

                // show delete message confirmaion
                modal.show();
            }
        });

         // Function to delete message from table
        document.getElementById('confirmDeleteBtn').addEventListener('click', function () {

            if (!selectedId) {
                console.error("No record selected for deletion.");
                return;
            }

            else {

                var xhr = new XMLHttpRequest();
			    xhr.open('DELETE', '#event.buildLink( "messages/delete" )#', true);

                xhr.onreadystatechange = function () {
                    if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {

                        var jsonResponse = JSON.parse(xhr.responseText);
                        console.log("Response: ", jsonResponse);

                        // Reload page
                        location.reload(true);

                    } else if (xhr.readyState === XMLHttpRequest.DONE) {

                        var errorResponse = JSON.parse(xhr.responseText);
                        console.log("Error: ", errorResponse);

                        // Reload page
                        location.reload(true);

                    }
			    };

                // Create the request body as JSON
                var requestBody = JSON.stringify({ id: selectedId }); 
                xhr.send(requestBody);



            }

        });
    
    </script>

    

</cfoutput>
