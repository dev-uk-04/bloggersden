<%@page import="com.bloggersden.helper.ConnectionProvider"%>
<%@page import="com.bloggersden.dao.PostDao"%>
<%@page import="com.bloggersden.entities.Post"%>
<%@page import="java.util.List"%>

<div class="row">
	<%
	Thread.sleep(500);
	PostDao pDao = new PostDao(ConnectionProvider.getConnection());
	List<Post> posts = null;

	int catId = Integer.parseInt(request.getParameter("cid"));

	if (catId == 0) {
		posts = pDao.getAllPosts();
	} else {
		posts = pDao.getPostByCategory(catId);
	}

	if (posts.size() == 0) {
		out.println("<h4 class='ml-auto mr-auto text-center'>No Posts in this category.</h4>");
		return;
	}

	for (Post p : posts) {
	%>
	<div class="col-md-6 mt-2">
		<div class="card">
			<img class="card-img-top" src="blogpics/<%=p.getPostPic()%>"
				alt="Card image cap">
			<div class="card-body">
				<b><%=p.getPostTitle()%></b>
				<p><%=p.getPostContent()%></p>
			</div>

			<div class="card-footer text-center primary-background">
				<a href="showblog.jsp?post_id=<%=p.getPostId() %>" class="btn btn-outline-light btn-sm">Read More</a> <a
					href="#" class="btn btn-outline-light btn-sm"><i
					class="fa fa-light fa-thumbs-up"></i><span> 10</span></a> <a href="#"
					class="btn btn-outline-light btn-sm"><i
					class="fa fa-comment-dots"></i><span> 20</span></a>
			</div>
		</div>
	</div>

	<%
	}
	%>
</div>