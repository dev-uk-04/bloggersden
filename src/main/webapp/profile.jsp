<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="com.bloggersden.helper.ConnectionProvider"%>
<%@ page import="com.bloggersden.entities.User"%>
<%@ page import="com.bloggersden.entities.Category"%>
<%@ page import="com.bloggersden.dao.PostDao"%>
<%@ page errorPage="errorpage.jsp"%>

<%

User user = (User) session.getAttribute("currentUser");
if (user == null) {
	response.sendRedirect("loginpage.jsp");
}

%>

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

<title>Profile</title>
</head>
<body>

	<!-- Navbar -->
	<%@include file="navbar.jsp"%>

	<!-- Create post modal -->
	<%@include file="createpost.jsp"%>

	<main>
		<div class="container">
			<div class="row mt-4">
				<!-- Categories -->
				<div class="col-md-4">
					<div class="list-group">
						<a href="#" onclick="getPosts(0, this)"
							class="c-link list-group-item list-group-item-action"> All
							Posts </a>

						<%
						for (Category c : catList) {
						%>
						<a href="#" onclick="getPosts(<%=c.getCategoryId()%>, this)"
							class="c-link list-group-item list-group-item-action"> <%=c.getCategoryName()%>
						</a>
						<%
						}
						%>

					</div>
				</div>

				<!-- Posts -->
				<div class="col-md-8">
					<div class="container text-center" id="loader">
						<i class="fa fa-refresh fa-spin fa-3x"></i>
						<h4>Loading...</h4>
					</div>

					<div class="container-fluid" id="posts-container"></div>
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
	<script>
		function getPosts(catId, catLink) {
			$('#loader').show();
			$('#posts-container').hide();
			$('.c-link').removeClass('active');
			
			$.ajax({
				url : "loadposts.jsp",
				data : {cid: catId},
				success : function(data, textStatus, jqXHR) {
					console.log(data);
					$('#loader').hide();
					$('#posts-container').show();
					$('#posts-container').html(data);
					$(catLink).addClass('active');
				}
			})
		}

		$(document).ready(function(e) {
			getPosts(0);
		})
	</script>

</body>
</html>