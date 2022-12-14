<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Melong</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	
	<style>
		a, a:hover {text-decoration:none;}
		
		#wrap {width:1200px; margin:auto;}
		header {height:100px;}
		nav {height:40px;}
		.contents {height:auto;}
		footer {height:100px;}
		
		.input-group {width:500px;}
	</style>
</head>
<body>
	<div id="wrap">
		<header class="d-flex">
			<jsp:include page="header.jsp" />
		</header>
		<nav>
			<jsp:include page="menu.jsp" />
		</nav>
		<section class="contents mt-3">
			<jsp:include page="list.jsp" />
		</section>
		<hr>
		<footer>
			<jsp:include page="footer.jsp" />
		</footer>
	</div>
</body>
</html>