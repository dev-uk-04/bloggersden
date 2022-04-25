<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="java.sql.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.bloggersden.helper.ConnectionProvider"%>
<%@page import="com.bloggersden.entities.User"%>
<%@page import="com.bloggersden.entities.Category"%>
<%@page import="com.bloggersden.dao.PostDao"%>


<!-- Create Post Modal -->

<div class="modal fade" id="createPostModal" tabindex="-1" role="dialog"
	aria-labelledby="createPostModal" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="createPostModalLabel">Add your post</h5>
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