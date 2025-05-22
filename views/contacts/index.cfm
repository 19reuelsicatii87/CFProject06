<cfoutput>
    <section id="contact-form">
        <div class="container py-5">

    <!--- div class="container my-5">

    <h1>My Contacts - Local Variable</h1>

    #html.table( 
            data=prc.aContacts, 
            class="table table-striped", 
            columns = [
                { key = "id", label = "ID" },
                { key = "name", label = "Name" },
                { key = "city", label = "City" }
            ]
        )#

    <!--- <pre>#serializeJson(prc.aContacts)#</pre> --->

    </div>


    <div class="container my-5">

 
    <h1>My Contacts - Local Database</h1>

    #html.table( 
            data=prc.dbContacts, 
            class="table table-striped", 
            columns = [
                { key = "id", label = "ID" },
                { key = "firstName", label = "First Name" },
                { key = "lastName", label = "Last Name" },
                { key = "email", label = "Email" }
            ]
        )#

    <!--- <pre>#serializeJson(prc.dbContacts)#</pre> --->

    </div --->


            <h1>My Contacts - Form</h1>

            #html.table( 
                    data=prc.contactArr, 
                    class="table table-striped", 
                    columns = [
                        { key = "fullname", label = "FullName" },
                        { key = "emailAddress", label = "Email" },
                        { key = "number", label = "Number" },
                        { key = "message", label = "Message" }
                    ]
                )#

            <!--- <pre>#serializeJson(prc.dbContacts)#</pre> --->

            </div>

    
    
        </div>
    </section >
</cfoutput>