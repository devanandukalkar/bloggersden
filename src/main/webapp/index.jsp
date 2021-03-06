<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="com.bloggersden.helper.ConnectionProvider"%>
<%@page import="com.bloggersden.entities.User"%>
<%@page import="com.bloggersden.entities.Category"%>
<%@page import="com.bloggersden.entities.Post"%>
<%@page import="com.bloggersden.dao.PostDao"%>
<%@page import="java.util.List"%>
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
			<!-- Create Post trigger modal -->
			<a class="btn btn-success" data-toggle="modal"
				data-target="#createPostModal"> Create Post</a>
			<%
			}
			%>

		</div>
	</div>

	<!-- Create post modal -->
	<%@include file="createpost.jsp"%>


	<!-- Posts -->
	<%
	Thread.sleep(500);
	PostDao pDao = new PostDao(ConnectionProvider.getConnection());
	List<Post> posts = null;
	posts = pDao.getAllPosts();
	%>


	<div class="container">
		<div class="row ml-auto">
			<%
			for (Post p : posts) {
			%>
			<div class="col-md-4 mt-3">
				<div class="card" style="width: 20rem;">
					<img class="card-img-top" src="blogpics/<%=p.getPostPic()%>"
						height="200px" width="100px">
					<div class="card-body">
						<b><%=p.getPostTitle()%></b>
					</div>

					<div class="card-footer text-center primary-background">
						<a href="showblog.jsp?post_id=<%=p.getPostId()%>"
							class="btn btn-outline-light btn-sm">Read More</a> <a href="#"
							class="btn btn-outline-light btn-sm"><i
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
	<script src="https://kit.fontawesome.com/8a89d31ffa.js"
		crossorigin="anonymous"></script>
	<script src="js/index.js"></script>
</body>
</html>