<cfoutput>
	<section id="login-form">
        <div class=''>
            <div class='container py-5 my-5 px-2'>

				<!--- Login Form --->
                <div class='row d-flex justify-content-center my-5'>
				<div class="col-lg-6 my-5">

					<h1>cbSecurity - Authentication</h1>
					<form action="#event.buildLink( "login/doLogin" )#">
						<div class="mb-3">
							<div class="input-group mb-3">
							<span class="input-group-text" id="basic-addon1">Username</span>
							<input id="username" name="username" type="text" class="form-control" placeholder="john@doe.com" >
							</div>
						</div>
						<div class="mb-3">
							<div class="input-group mb-3">
							<span class="input-group-text" id="basic-addon2">Password</span>
							<input id="password" name="password" type="password" class="form-control">
							</div>
						</div>
						<div class="d-grid">
							<button type="submit" class="btn btn-primary">Submit</button>
						</div>
						<cfif flash.exists( "message" )>			
							<p class="bg-danger-subtle text-danger px-5 my-2">
								#flash.get( "message" )#
							</p>							
						</cfif>					
					</form>
				</div>
            </div>
        </div>
    </section>
</cfoutput>

