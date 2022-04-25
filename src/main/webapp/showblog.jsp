<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.bloggersden.helper.ConnectionProvider"%>
<%@ page import="com.bloggersden.entities.User"%>
<%@ page import="com.bloggersden.entities.Post"%>
<%@ page import="com.bloggersden.entities.Category"%>
<%@ page import="com.bloggersden.dao.PostDao"%>
<%@ page errorPage="errorpage.jsp"%>

<%
User user = (User) session.getAttribute("currentUser");
if (user == null) {
	response.sendRedirect("loginpage.jsp");
}
%>
<%
int postId = Integer.parseInt(request.getParameter("post_id"));
PostDao pd = new PostDao(ConnectionProvider.getConnection());
Post post = pd.getPostByPostId(postId);
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


<title><%=post.getPostTitle()%></title>
</head>
<body>
	<%@include file="navbar.jsp"%>

	<div class="container">
		<div class="row mt-4">
			<div class="col-md-10 offset-md-1">
				<div class="card">
					<div class="card-header primary-background text-white post-title">
						<h4><%=post.getPostTitle()%></h4>
					</div>
					<div class="car-body">
						<img class="card-img-top" src="blogpics/<%=post.getPostPic()%>"
							height="400px" , width="200px">
						<div class="container">
							<div class="row my-3">
								<div class="col-md-8">
									<p>
										<img src="pics/<%=user.getUserProfile()%>" class="user-image"><a
											href="#"> <%=user.getUserName()%></a>
									</p>
								</div>
								<div class="col-md-4">
									<p class="post-date"><%=post.getPostDate().toLocaleString()%></p>
								</div>
							</div>
							<p class="post-content"><%=post.getPostContent()%></p>
							<br> <br>
							<div class="post-code">
								<pre> <%=post.getPostCode()%></pre>
							</div>
						</div>
					</div>
					<div class="card-footer text-center primary-background">
						<a href="#" class="btn btn-outline-light btn-sm"><i
							class="fa fa-light fa-thumbs-up"></i><span> 10</span></a> <a href="#"
							class="btn btn-outline-light btn-sm"><i
							class="fa fa-comment-dots"></i><span> 20</span></a>
					</div>
				</div>
			</div>
		</div>
	</div>

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