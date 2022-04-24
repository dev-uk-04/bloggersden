// User Profile Details (index.jsp)
$(document).ready(function() {
	let editStatus = false;

	$('#edit-profile-button').click(function() {
		if (!editStatus) {
			$("#profileDetails").hide();
			$("#profileEdit").show();
			editStatus = true;
			$(this).text("Back");
		} else {
			$("#profileDetails").show();
			$("#profileEdit").hide();
			editStatus = false;
			$(this).text("Edit");
		}
	});
});


// User Registration (register.jsp)
$(document).ready(function() {
	console.log("Loaded...");

	$('#gender').click(function() {

	});


	$('#registerForm').on('submit', function(event) {
		event.preventDefault();

		$('#loader').show();
		$('#submitButton').hide();

		let form = new FormData(this);

		// Send form to RegisterServlet

		$.ajax({
			url: "RegisterServlet",
			type: "POST",
			data: form,
			success: function(data, textStatus, jqXHR) {
				console.log(data);
				$('#loader').hide();
				$('#submitButton').show();

				if (data.trim() == "User Saved") {
					swal("Registered Successfully! Redirecting to login page.")
						.then((value) => {
							window.location = "loginpage.jsp"
						});
				} else {
					swal(data);
				}
			},
			error: function(jqXHR, textStatus, errorThrown) {
				console.log(jqXHR);
				$('#loader').hide();
				$('#submitButton').show();
				swal("Something went wrong! Try Again!")
			},
			processData: false,
			contentType: false
		});
	});
});