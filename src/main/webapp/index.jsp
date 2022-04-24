<%@page import="com.bloggersden.helper.ConnectionProvider"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="com.bloggersden.entities.User"%>
<%@page import="com.bloggersden.entities.Category"%>
<%@page import="com.bloggersden.dao.PostDao"%>
<%@page import="java.util.ArrayList"%>
<%@ page errorPage="errorpage.jsp"%>

<%
User user = (User) session.getAttribute("currentUser");
%>


<!DOCTYPE html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="css/Styles.css" rel="stylesheet" type="text/css">

<title>Bloggers Den</title>

</head>
<body>
	<!-- Navbar -->
	<%@include file="navbar.jsp"%>

	<!-- Banner -->
	<div class="container-fluid p-0 m-0">
		<div
			class="jumbotron primary-background text-white text-center banner-background">
			<div class="container">
				<h3 class="display-3">Welcome to Blogger's Den</h3>
				<br>
				<h6>Explore and Share the knowledge, experiences & musings.</h6>
			</div>
			<br>
			<%
			if (user == null) {
			%>
			<a href="register.jsp" class="btn btn-warning"> <span
				class="fa fa-sign-in"></span> Get Started
			</a>
			<%
			} else {
			%>
			<!-- Button trigger modal -->
			<a class="btn btn-success" data-toggle="modal"
				data-target="#createPostModal"> Create Post</a>
			<%
			}
			%>

		</div>
	</div>

	<!-- Create Post Modal -->

	<div class="modal fade" id="createPostModal" tabindex="-1"
		role="dialog" aria-labelledby="createPostModal" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="createPostModalLabel">Add your
						post</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">

					<form id="createPostForm" action="AddPostServlet" method="post"
						enctype='multipart/form-data'>
						<div class="form-group">
							<select class="form-control" name="catId">
								<option selected disabled>Select Category</option>
								<%
								PostDao postDao = new PostDao(ConnectionProvider.getConnection());
								ArrayList<Category> catList = postDao.getAllCategories();
								for (Category c : catList) {
								%>
								<option value="<%=c.getCategoryId()%>"><%=c.getCategoryName()%></option>
								<%
								}
								%>
							</select>
						</div>

						<div class="form-group">
							<input type="text" placeholder="Enter post title"
								class="form-control" name="postTitle">
						</div>

						<div class="form-group">
							<textarea class="form-control" placeholder="Enter post content"
								style="height: 200px" name="postContent"></textarea>
						</div>

						<div class="form-group">
							<textarea class="form-control" placeholder="Enter code if any"
								style="height: 100px" name="postCode"></textarea>
						</div>

						<div class="form-group">
							<label>Select picture for your blog post:</label> <input
								type="file" placeholder="Enter picture" name="postPic"
								accept="image/png, image/gif, image/jpeg">
						</div>

						<div class="container text-center">
							<button type="submit" class="btn btn-primary primary-background">Post</button>
						</div>

					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- End of Create Post Modal -->


	<!-- 	Posts  -->
	<div class="container">
		<div class="row mb-4 ml-auto">
			<div class="col-md-4">
				<div class="card" style="width: 18rem;">
					<div class="card-body">
						<h5 class="card-title">Java Programming</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn primary-background text-white">Read
							More</a>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card" style="width: 18rem;">
					<div class="card-body">
						<h5 class="card-title">Java Programming</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn primary-background text-white">Read
							More</a>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card" style="width: 18rem;">
					<div class="card-body">
						<h5 class="card-title">Java Programming</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn primary-background text-white">Read
							More</a>
					</div>
				</div>
			</div>
		</div>
		<div class="row mb-4 ml-auto">
			<div class="col-md-4">
				<div class="card" style="width: 18rem;">
					<div class="card-body">
						<h5 class="card-title">Java Programming</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn primary-background text-white">Read
							More</a>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card" style="width: 18rem;">
					<div class="card-body">
						<h5 class="card-title">Java Programming</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn primary-background text-white">Read
							More</a>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card" style="width: 18rem;">
					<div class="card-body">
						<h5 class="card-title">Java Programming</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn primary-background text-white">Read
							More</a>
					</div>
				</div>
			</div>
		</div>
		<div class="row mb-4  ml-auto">
			<div class="col-md-4">
				<div class="card" style="width: 18rem;">
					<div class="card-body">
						<h5 class="card-title">Java Programming</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn primary-background text-white">Read
							More</a>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card" style="width: 18rem;">
					<div class="card-body">
						<h5 class="card-title">Java Programming</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn primary-background text-white">Read
							More</a>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card" style="width: 18rem;">
					<div class="card-body">
						<h5 class="card-title">Java Programming</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn primary-background text-white">Read
							More</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- End of Posts -->

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
	<script src="js/index.js"></script>
</body>
</html>