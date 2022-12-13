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
	<%
		List<Map<String, Object>> list = new ArrayList<>();
		Map<String, Object> map = new HashMap<String, Object>() {
			{
				put("id", 1000);
				put("title", "아몬드");
				put("author", "손원평");
				put("publisher", "창비");
				put("image", "http://image.kyobobook.co.kr/images/book/xlarge/267/x9788936434267.jpg");
			}
		};
		list.add(map);
		
		map = new HashMap<String, Object>() {
			{
				put("id", 1001);
				put("title", "사피엔스");
				put("author", "유발 하라리");
				put("publisher", "김영사");
				put("image", "http://image.kyobobook.co.kr/images/book/xlarge/464/x9788934972464.jpg");
			}
		};
		list.add(map);
		
		map = new HashMap<String, Object>() {
			{
				put("id", 1002);
				put("title", "코스모스");
				put("author", "칼 세이건");
				put("publisher", "사이언스북");
				put("image", "http://image.kyobobook.co.kr/images/book/xlarge/892/x9788983711892.jpg");
			}
		};
		list.add(map);
		
		map = new HashMap<String, Object>() {
			{
				put("id", 1003);
				put("title", "나미야 잡화점의 기적");
				put("author", "히가시노 게이고");
				put("publisher", "현대문학");
				put("image", "http://image.kyobobook.co.kr/images/book/xlarge/194/x9788972756194.jpg");
			}
		};
		list.add(map);
	%>
	
	<%
		int id = Integer.valueOf(request.getParameter("id"));
		Map<String, Object> target = new HashMap<>();
		
		for (Map<String, Object> item : list) {
			if ((int)item.get("id") == id) {
				target = item;
				break;
			}
		}
	%>
	
	<div class="container d-flex">
		<div>
			<img src="<%= target.get("image") %>" alt="표지" width="300">
		</div>
		<div>
			<span class="display-1 font-weight-bold d-block"><%= target.get("title") %></span>
			<span class="display-2 text-info d-block"><%= target.get("author") %></span>
			<span class="display-4 text-secondary d-block"><%= target.get("publisher") %></span>
		</div>
	</div>
</body>
</html>