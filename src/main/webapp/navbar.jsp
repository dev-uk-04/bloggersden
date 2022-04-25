<%@page import="com.bloggersden.entities.User"%>
<%@page import="com.bloggersden.entities.Message"%>

<%
User loggedUser = (User) session.getAttribute("currentUser");
%>

<nav
	class="navbar navbar-expand-lg navbar-dark bg-dark primary-background">
	<a class="navbar-brand" href="index.jsp"><span class="fa-solid fa-blog"></span>
		&nbsp;Bloggers Den</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="search-container">
		<form class="form-inline my-2 my-lg-0">
			<input class="form-control mr-sm-2" type="search"
				placeholder="Search" aria-label="Search">
			<button class="btn btn-outline-light my-2 my-sm-0" type="submit">Search</button>
		</form>
	</div>
	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav ml-auto">
			<li class="nav-item active"><a class="nav-link" href="index.jsp">Home
					<span class="sr-only">(current)</span>
			</a></li>
			<li class="nav-item"><a class="nav-link" href="#">Contact</a></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> Categories </a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdown">
					<a class="dropdown-item" href="#">Programming Language</a> <a
						class="dropdown-item" href="#">Data Structures & Algorithms</a>
				</div></li>
			<%
			if (loggedUser != null) {
			%>
			<!-- Create Post trigger modal -->

			<li class="nav-item"><a class="nav-link mr-auto" href="#!"
				data-toggle="modal" data-target="#createPostModal"><i
					class="	fa fa-plus-circle"></i>&nbsp; Create Post</a></li>


			<li class="nav-item dropdown"><a
				class="nav-link mr-auto dropdown-toggle" href="#!" role="button"
				data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i
					class="fa fa-light fa-user"></i> &nbsp;<%=loggedUser.getUserName()%></a>
				<div class="dropdown-menu" aria-labelledby="profileDropdown">
					<a class="dropdown-item" href="profile.jsp">Profile</a> <a
						class="dropdown-item" href="#!" data-toggle="modal"
						data-target="#profile-modal">Edit Details</a>
				</div></li>

			<li class="nav-item"><a class="nav-link" href="LogoutServlet"><i
					class="fa fa-sign-out"></i> Logout</a></li>
			<%
			} else {
			%>
			<li class="nav-item"><a class="nav-link" href="loginpage.jsp">
					<span class="fa fa-user-circle-o"></span> Login
			</a></li>
			<%
			}
			%>
		</ul>

	</div>
</nav>

<%
if (loggedUser != null) {
%>

<!-- Create Post Modal -->
<%@include file="createpost.jsp"%>

<!-- Profile Modal -->

<div class="modal fade" id="profile-modal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header primary-background text-white">
				<h5 class="modal-title" id="usernameModalLabel">Blogger's Den</h5>
				<button type="button" class="close text-white" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
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
			<div class="modal-body">
				<div class="container text-center">
					<img src="pics/<%=loggedUser.getUserProfile()%>" width=200
						height=160>
					<h6 class="modal-title" id="usernameModalLabel"><%=loggedUser.getUserName()%></h6>
				</div>
				<br>
				<div id="profileDetails">
					<table class="table">
						<tbody>
							<tr>
								<th scope="row" class="text-center">ID</th>
								<td><%=loggedUser.getUserId()%></td>
							</tr>
							<tr>
								<th scope="row" class="text-center">Name</th>
								<td><%=loggedUser.getUserName()%></td>
							</tr>
							<tr>
								<th scope="row" class="text-center">Email</th>
								<td><%=loggedUser.getUserEmail()%></td>
							</tr>
							<tr>
								<th scope="row" class="text-center">Gender</th>
								<td><%=loggedUser.getUserGender()%></td>
							</tr>
						</tbody>
					</table>
				</div>

				<div id="profileEdit" style="display: None">
					<h4 class="mt-3 text-center">Edit your details</h4>
					<form action="EditServlet" method="post"
						enctype="multipart/form-data">
						<table class="table">
							<tr>
								<td>ID</td>
								<td><%=loggedUser.getUserId()%></td>
							</tr>
							<tr>
								<td>Name</td>
								<td><input type="text" class="form-control" name="editName"
									value="<%=loggedUser.getUserName()%>"></td>
							</tr>
							<tr>
								<td>Email</td>
								<td><input type="email" class="form-control"
									name="editEmail" value="<%=loggedUser.getUserEmail()%>"></td>
							</tr>
							<tr>
								<td>Password</td>
								<td><input type="password" class="form-control"
									name="editPassword" value="<%=loggedUser.getUserPassword()%>"></td>
							</tr>
							<tr>
								<td>Gender</td>
								<td><%=loggedUser.getUserGender().toUpperCase()%></td>
							</tr>
							<tr>
								<td>Choose profile pic</td>
								<td><input type="file" name="image" class="form-control"
									accept="image/png, image/gif, image/jpeg"></td>
							</tr>
						</table>
						<div class="container text-center">
							<button class="btn btn-danger">Save</button>
						</div>
					</form>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				<button id="edit-profile-button" type="button"
					class="btn btn-primary primary-background">Edit</button>
			</div>
		</div>
	</div>
</div>
<%
}
%>