package com.test.lesson01;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/lesson01/ex04")
public class GetMethodEx04 extends HttpServlet {
	
	// Request 방식 (method)
	// - Get : 쿼리 스트링이 있음 -> 브라우저 주소, a태그 클릭, form 태그
	// - Post
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("utf-8");
//		response.setContentType("text/plain");
		response.setContentType("text/html");
		
		// request parameter 꺼내기 - form의 name
		String userId = request.getParameter("userId");
		String name = request.getParameter("name");
		String birth = request.getParameter("birth");
		String email = request.getParameter("email");
		
		// http://localhost/lesson01/ex04?userId=marobiana&name=%EC%8B%A0%EB%B3%B4%EB%9E%8C&birth=19981108&email=sbr%40kakao.com
		
		PrintWriter out = response.getWriter();
		
		// 출력
//		out.println("userId" + userId);
//		out.println("name" + name);
//		out.println("birth" + birth);
//		out.println("email" + email);
		
		// 테이블로 출력
		out.print("<html><head><title>회원 정보</title></head><body>");
		out.print("<table border=1>");
		out.print("<tr><th>아이디</th><td>" + userId + "</td></tr>");
		out.print("<tr><th>이름</th><td>" + name + "</td></tr>");
		out.print("<tr><th>생년월일</th><td>" + birth + "</td></tr>");
		out.print("<tr><th>이메일</th><td>" + email + "</td></tr>");
		out.print("</table>");
		out.print("</body></html>");
	}

}
