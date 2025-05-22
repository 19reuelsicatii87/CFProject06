<cfoutput>
	<section id="contact-form">
		<div class="container py-5">
			<div class="px-2 py-5 shadow">
				<div class="row d-flex justify-content-center">
					<div class="col-md-6">
						<div class="d-flex justify-content-center">
							<i class="bi bi-envelope" style="fontSize: 70px"></i>
						</div>
						<h2 class="text-center fw-bold mb-0 pb-0">Leave Us a Message</h2>
						<p class="text-center mt-0 pt-0">We would love to hear from you</p>
					</div>
				</div>

				<!---form action="#event.buildLink( "contactus.save" )#" method="POST"--->
				<form id="contactusSaveForm">
					<div class="row d-flex justify-content-center mb-5">
						<div class="col-md-9">
							<div class="mb-3">
								<div class="input-group mb-3">
									<span class="input-group-text ">
										Fullname<small style="color: red; padding-left: 0.2em">(REQ)</small>
									</span>
									<input
										type ="text"
										id ="fullname"
										name ="fullname"
										class="form-control"
										aria-describedby="emailHelp"
										placeholder="Juan Dela Cruz"
									>
										
									</input>
								</div>

								<div class="input-group mb-3">
									<span class="input-group-text">
										Email<small style="color: red; padding-left: 0.2em">(REQ)</small>
									</span>
									<input
										type ="email"
										id ="email"
										name ="email"
										class="form-control"
										aria-describedby="emailHelp"
										placeholder="juandelacruz@gmail.com"
									>
										
									</input>
								</div>
								<div class="input-group mb-0 pb-0">
									<span class="input-group-text">
										Number<small style="color: red; padding-left: 0.2em">(REQ)</small>
									</span>
									<input
										type ="text"
										id ="number"
										name ="number"
										class="form-control"
										aria-describedby="emailHelp"
										placeholder="+63 917 4676123"
									>
										
									</input>
								</div>
								<div class="text-start mb-3">
									<sub class="mx-1" style="fontSize: 0.6em">Please include Country and Area code (eg. 63 917 4676123)</sub>
								</div>
								<div class="input-group mb-3">
									<span class="input-group-text">
										Message<small style="color: red; padding-left: 0.2em">(REQ)</small>
									</span>
									<textarea
										id = "message"
										name = "message"
										class = "form-control"
										placeholder="Drop your message here and we'll connect on your most immediate and available time."
										rows = "6"
									></textarea>
								</div>
							</div>
							<button id="contactusSaveButton" type="submit" class="btn btn-primary btn-lg w-100"
								onclick="contactusSave(event, '#event.buildLink( "contactus/save" )#')" disabled>Submit</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</section>

	<!--- Modal --->
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
			<div class="modal-header">
				<h1 class="modal-title fs-5" id="exampleModalTitle"></h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body" id="exampleModalBody">
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
			</div>
			</div>
		</div>
	</div>
	

	<script>
		// Function to handle form submission via AJAX
		function contactusSave(event, url) {

			// When the button is clicked, it is supposed to trigger the contactusSave() function, 
			// but because the button is within a form and the onclick handler doesn't prevent the default action, 
			// the form may be submitting before your AJAX request is complete
			// Prevent form from submitting
			event.preventDefault(); 

			const form = document.getElementById("contactusSaveForm");
			const formData = new FormData(form);

			var xhr = new XMLHttpRequest();
			xhr.open('POST', url, true);

			
			// State Transitions
			// 0 (UNSENT): XMLHttpRequest object created.
			// 1 (OPENED): open() method called to initialize the request.
			// 2 (HEADERS_RECEIVED): Headers received from the server.
			// 3 (LOADING): Response body is being received.
			// 4 (DONE): Entire operation is complete

			// By attaching the event listener before calling xhr.send(), you ensure that your code is prepared to handle 
			// all possible state changes of the request as soon as they occur. If you attach the listener after xhr.send(), 
			// you might miss some state transitions, especially in very fast operations.
			// The purpose of setting onreadystatechange first is to prepare your code to handle the asynchronous response process properly
			xhr.onreadystatechange = function () {
				if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {

					var jsonResponse = JSON.parse(xhr.responseText);
					console.log("Response: ", jsonResponse);

					// Call renderModal with response data
					renderModal(jsonResponse);

				} else if (xhr.readyState === XMLHttpRequest.DONE) {

					var errorResponse = JSON.parse(xhr.responseText);
					console.log("Error: ", errorResponse);

					// Handle error scenario
					renderModal(errorResponse); 
				}
			};


			// By writing the xhr.onreadystatechange before calling xhr.send(), 
			// you ensure that your code is prepared to handle all possible state changes 
			// of the request as soon as they occur. If you attach the listener after xhr.send(), 
			// you might miss some state transitions, especially in very fast operations.
	
			// Once xhr.send() is called:
			// The browser handles the HTTP request in the background.
			// The onreadystatechange handler is triggered whenever the readyState changes.
			xhr.send(formData);


		}

		// Function to render the modal
		function renderModal(response) {
			console.log("render DATA -- ", JSON.stringify(response));
			console.log("access DATA.title -- ", response.title);
			console.log("access DATA.message -- ", response.message);

			var modal = new bootstrap.Modal(document.getElementById('exampleModal'), {
				keyboard: true
			});

			// Set modal title and body content
			document.getElementById('exampleModalTitle').innerText = response.title;
			document.getElementById('exampleModalBody').innerText = response.message;

			// Show the modal
			modal.show();
		}
	</script>

	<script>
    // Get references to the input fields and button
    const fullnameField = document.getElementById('fullname');
    const emailField = document.getElementById('email');
	const numberField = document.getElementById('number');
    const messageField = document.getElementById('message');

    const submitButton = document.getElementById('contactusSaveButton');

    // Function to check if fields are populated
    function checkFields() {

        const isFullnamePopulated = fullnameField.value.trim() !== '';
        const isEmailPopulated = emailField.value.trim() !== '';
		const isNumberPopulated = numberField.value.trim() !== '';
        const isMessagePopulated = messageField.value.trim() !== '';

        // Enable the button if both fields are populated
        submitButton.disabled = !(isFullnamePopulated && isEmailPopulated && isNumberPopulated && isMessagePopulated);
    }

    // Add event listeners to the input fields
    fullnameField.addEventListener('input', checkFields);
    emailField.addEventListener('input', checkFields);
	numberField.addEventListener('input', checkFields);
    messageField.addEventListener('input', checkFields);


	</script>

</cfoutput>
