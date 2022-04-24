<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<!-- Bootstrap CSS -->

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="css/Styles.css" rel="stylesheet" type="text/css">
<title>Error</title>
</head>
<body>
	<div class="container text-center">
		<img src="img/error.png" class="img-fluid" width="300" height="400">
		<h3 class="display-4">Sorry...Something went wrong!</h3>
		<%= exception %> 
		<a href="index.jsp"
			class="btn btn-primary primary-background text-white btn-lg mt-3">Home</a>
	</div>
</body>
</html>