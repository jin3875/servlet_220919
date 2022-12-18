<%@page import="java.sql.ResultSet"%>
<%@page import="com.test.common.MysqlService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>즐겨찾기</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>
<%--
	1) 테이블 생성
	
	create table `bookmark` (
		`id` int not null auto_increment primary key
		, `name` varchar(16) not null
		, `url` varchar(128) not null
		, `createdAt` timestamp DEFAULT current_timestamp
		, `updatedAt` timestamp DEFAULT current_timestamp
	) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
	
	2) 데이터 저장
	
	insert into `bookmark`
	(`name`, `url`, `createdAt`, `updatedAt`)
	values
	('마론달', 'http://marondal.com', now(), now())
	, ('구글', 'https://google.com', now(), now())
	, ('네이버', 'https://naver.com', now(), now())
	, ('다음', 'https://daum.com', now(), now());
--%>

<%
	MysqlService ms = MysqlService.getInstance();
	ms.connect();
	
	String selectQuery = "select * from `bookmark` order by `id` desc";
	
	ResultSet rs = ms.select(selectQuery);
%>
	<div class="container">
		<table class="table">
			<thead>
				<tr>
					<th>사이트</th>
					<th>사이트 주소</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody>
			<%
				while (rs.next()) {
			%>
				<tr>
					<td><%= rs.getString("name") %></td>
					<td><a href="<%= rs.getString("url") %>"><%= rs.getString("url") %></a></td>
					<td><a href="/lesson04/quiz02_delete?id=<%= rs.getString("id") %>">삭제하기</a></td>
				</tr>
			<%
				}
			%>
			</tbody>
		</table>
	</div>

<%
	ms.disconnect();
%>
</body>
</html>