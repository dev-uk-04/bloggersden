<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.bloggersden.entities.Message"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link href="css/Styles.css" rel="stylesheet" type="text/css">
<title>Login</title>
</head>
<body>
	<!-- Navbar -->

	<%@include file="navbar.jsp"%>
	<!-- Login Form -->

	<main
		class="d-flex align-items-center primary-background banner-background"
		style="height: 90vh">
		<div class="container">
			<div class="row">
				<div class="col-md-4 offset-md-4">
					<div class="card">
						<div class="card-header primary-background text-white text-center">
							<span class="fa fa-solid fa-user fa-3x"></span><br>
							<span>Login</span>
						</div>
						<%
						Message msg = (Message) session.getAttribute("message");
						if (msg != null) {
						%>
						<div class="alert <%=msg.getCssClass()%>" role="alert">
							<%=msg.getContent()%>
						</div>
						<%
						session.removeAttribute("message");
						}
						%>
						<div class="card-body">
							<form action="LoginServlet" method="post">
								<div class="form-group">
									<label for="exampleInputEmail1">Email address</label> <input
										name="loginEmail" type="email" class="form-control"
										id="exampleInputEmail1" aria-describedby="emailHelp"
										placeholder="Enter email"> <small id="emailHelp"
										class="form-text text-muted">We'll never share your
										email with anyone else.</small>
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">Password</label> <input
										name="loginPassword" type="password" class="form-control"
										id="exampleInputPassword1" placeholder="Password">
								</div>
								<br>
								<div class="container text-center">
									<button type="submit"
										class="btn btn-primary primary-background">Login</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>


	<!-- Bootstrap Bundle with Popper -->
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
	<script src="https://kit.fontawesome.com/8a89d31ffa.js"
		crossorigin="anonymous"></script>
	<script src="js/index.js"></script>
</body>
</html>