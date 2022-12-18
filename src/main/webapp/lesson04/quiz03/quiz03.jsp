<%@page import="java.sql.ResultSet"%>
<%@page import="com.test.common.MysqlService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HONG당무 마켓</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	
	<style>
		#wrap {width:1200px; margin:auto;}
		header {height:100px;}
		nav {height:60px;}
		.contents {min-height:500px;}
		footer {height:50px;}
		
		header, nav {background-color:coral;}
		nav .nav-link {font-size:18px;}
		.contents {flex-wrap : wrap;}
		.box {width:30%; height:300px; border-style: solid; border-color:coral;}
		.box:hover {background-color:darkorange;}
	</style>
</head>
<body>
	<div id="wrap">
		<header class="d-flex justify-content-center align-items-center">
			<h1 class="text-white">HONG당무 마켓</h1>
		</header>
		<nav class="d-flex align-items-center">
			<ul class="nav nav-fill w-100">
				<li class="nav-item"><a href="#" class="nav-link text-white font-weight-bold">리스트</a></li>
				<li class="nav-item"><a href="#" class="nav-link text-white font-weight-bold">물건 올리기</a></li>
				<li class="nav-item"><a href="#" class="nav-link text-white font-weight-bold">마이 페이지</a></li>
			</ul>
		</nav>
		<section class="contents">
			<div class="d-flex justify-content-between mt-3 flex-wrap">
		<%
			MysqlService ms = MysqlService.getInstance();
			ms.connect();
			
			String selectQuery = "select A.*, B.* from `seller` AS A join `used_goods` AS B on A.id = B.sellerId";
			
			ResultSet rs = ms.select(selectQuery);
			
			while (rs.next()) {
		%>
				<div class="box m-3">
					<%
						if (rs.getString("B.pictureUrl") != null) {
					%>
					<div><img src="<%= rs.getString("B.pictureUrl") %>" width="300"></div>
					<%
						} else {
					%>
					<div>이미지 없음</div>
					<%
						}
					%>
					<div class="font-weight-bold"><%= rs.getString("B.title") %></div>
					<div><%= rs.getString("B.price") %>원</div>
					<div><%= rs.getString("A.nickname") %></div>
				</div>
		<%
				}
			ms.disconnect();
		%>
			</div>
		</section>
		<footer class="d-flex justify-content-center align-items-center">
			<small class="text-secondary">Copyright 2019. HONG All Rights Reserved.</small>
		</footer>
	</div>
</body>
</html>