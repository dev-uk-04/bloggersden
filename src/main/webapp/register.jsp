<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.bloggersden.entities.Message"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<!-- Bootstrap CSS -->

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link href="css/Styles.css" rel="stylesheet" type="text/css">
<title>Register</title>
</head>
<body>

	<!-- Navbar -->
	<%@include file="navbar.jsp"%>
	<main
		class="d-flex align-items-center primary-background banner-background"
		style="height: 100vh">
		<div class="container">
			<div class="row">
				<div class="col-md-4 offset-md-4">
					<div class="card">
						<div class="card-header primary-background text-white text-center">
							<span class="fa fa-user-plus fa-3x"></span> <br>
							<p>Register</p>
						</div>

						<div class="card-body">
							<form action="RegisterServlet" method="post" id="registerForm">
								<div class="form-group">
									<label for="registerInputName">Enter your name</label> <input
										name="userName" type="text" class="form-control"
										id="registerInputName" placeholder="Full Name">
								</div>
								<div class="form-group">
									<label for="registerInputEmail">Email address</label> <input
										name="userEmail" type="email" class="form-control"
										id="registerInputEmail1" aria-describedby="emailHelp"
										placeholder="Enter email">
								</div>
								<div class="form-group">
									<label for="registerInputPassword">Password</label> <input
										name="userPassword" type="password" class="form-control"
										id="registerInputPassword" placeholder="Password">
								</div>
								<div class="form-group">
									<label for="registerGender">Select Gender</label> <br> <input
										type="radio" id="gender" name="userGender" value="Male">
									Male <input type="radio" id="gender" name="userGender"
										value="Female"> Female
								</div>
								<div class="form-check">
									<input type="checkbox" class="form-check-input" name="checkBox"
										id="registerCheck1"> <label class="form-check-label"
										for="registerCheck1">Agree Terms & Conditions</label>
								</div>
								<br>
								<div class="container text-center" id="loader"
									style="display: none;">
									<span class="fa fa-refresh fa-spin"></span>
									<h6>Please Wait....</h6>
								</div>
								<button type="submit" class="btn btn-primary primary-background"
									id="submitButton">Sign Up</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
	<!-- Bootstrap Bundle with Popper -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
	<script src="https://kit.fontawesome.com/8a89d31ffa.js"
		crossorigin="anonymous"></script>
	<script src="js/index.js"></script>
</body>
</html>