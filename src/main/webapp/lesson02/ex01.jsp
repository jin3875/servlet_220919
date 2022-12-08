<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ex01</title>
</head>
<body>
<!-- HTML 주석 : 페이지 소스 보기에서 보임 -->
<%-- JSP 주석 : 페이지 소스 보기에서 보이지 않음 --%>

<%--
	서블릿 : 자바 클래스 + HTML 태그
	JSP : HTML 태그 + 자바 구문 -> .jsp
	HTML : 태그 -> .html	
--%>

<%
	// 자바 문법 시작
	// scriptlet (스크립틀릿) - 메인 메소드 같은 느낌
	
	int sum = 0;
	
	for (int i = 0; i <= 10; i++) {
		sum += i;
	}
%>
<strong>합계 : </strong>
<input type="text" value="<%= sum %>">
<br>

<%!
	// 선언문 - 클래스 같은 느낌
	
	// 필드
	private int num = 100;
	
	// 메소드
	public String getHelloWorld() {
		return "Hello world!";
	}
%>
<%= num + 200 %><br>
<%= getHelloWorld() %>

<%
	List<Integer> list = new ArrayList<>();
%>
</body>
</html>