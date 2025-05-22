<cfoutput>

<section id="dummy">
    <div class='container py-3 px-2'>

        <div class="row my-5">

            <div class="input-group mb-3">
                <span class="input-group-text" id="basic-addon1">First Name: </span>
                <input type="text" class="form-control" placeholder="#rc.fname#" aria-label="Username" aria-describedby="basic-addon1">
            </div>
            <div class="input-group mb-3">
                <span class="input-group-text" id="basic-addon1">Last Name: </span>
                <input type="text" class="form-control" placeholder="#encodeForHTML( rc.lname )#" aria-label="Username" aria-describedby="basic-addon1">
            </div>
            
        </div>

        <div class="row my-5">

            <div class="input-group mb-3">
                <span class="input-group-text" id="basic-addon1">Weight: </span>
                <input type="text" class="form-control" placeholder="#prc.weight#" aria-label="Username" aria-describedby="basic-addon1">
            </div>
            <div class="input-group mb-3">
                <span class="input-group-text" id="basic-addon1">Height: </span>
                <input type="text" class="form-control" placeholder="#encodeForHTML( prc.height )#" aria-label="Username" aria-describedby="basic-addon1">
            </div>
            
        </div>


            <div class="row my-5">

            <div class="input-group mb-3">
                <span class="input-group-text" id="basic-addon1">Weight: </span>
                <input type="text" class="form-control" placeholder="#prc.fname#" aria-label="Username" aria-describedby="basic-addon1">
            </div>
            <div class="input-group mb-3">
                <span class="input-group-text" id="basic-addon1">Height: </span>
                <input type="text" class="form-control" placeholder="#encodeForHTML( prc.lname )#" aria-label="Username" aria-describedby="basic-addon1">
            </div>
            
        </div>



    </div>
</section>


</cfoutput>