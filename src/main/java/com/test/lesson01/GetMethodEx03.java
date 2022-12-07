package com.test.lesson01;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/lesson01/ex03")
public class GetMethodEx03 extends HttpServlet {
	
	// Request 방식 (method)
	// - Get : 쿼리 스트링이 있음 -> 브라우저 주소, a태그 클릭, form 태그
	// - Post
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/json");
		
		// request parameter 꺼내기
		String userId = request.getParameter("user_id");
		String name = request.getParameter("name");
		Integer age = Integer.valueOf(request.getParameter("age"));
		
		PrintWriter out = response.getWriter();
		
//		out.println("user_id : " + userId);
//		out.println("name : " + name);
//		out.println("age : " + age);
		
		// 자바스크립트 dictionary
		// : {"키1":value1, "키2":value2, ...}
		// : [{"키1":value1, "키2":value2, ...}, {"키1":value1, "키2":value2, ...}, ...]
		// -> JSON String
		// : "{"키1":value1, "키2":value2, ...}" -> parsing
		
		// JSON (JavaScript Object Notation) String으로 response 구성하기
		// {"user_id":"marobiana", "name":"신보람", "age":30}
		out.print("{\"user_id\":\"" + userId + "\", \"name\":\"" + name + "\", \"age\":" + age + "}");
	}

}
