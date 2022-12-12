<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>교포문고</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>	
	<%@include file="/lesson02/quiz08.jsp"%>
	
	<div class="container">
		<div class="d-flex">
			<%
				String id = request.getParameter("id");
				
				for (Map<String, Object> book : list) {
					if (Integer.parseInt(id) == (int)book.get("id")) {
			%>
			<img src=<%= book.get("image") %>>
			<div>
				<div class="display-1 font-weight-bold"><%= book.get("title") %></div>
				<div class="display-2 text-info"><%= book.get("author") %></div>
				<div class="display-3 text-secondary"><%= book.get("publisher") %></div>
			<%
					}
				}
			%>
			</div>
		</div>
	</div>
</body>
</html>