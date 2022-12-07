package com.test.lesson01;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/lesson01/quiz08")
public class GetMethodQuiz08 extends HttpServlet {
	
//	quiz08.html / GetMethodQuiz08.java / ex05.html / PostMethodEx05.java / CharacterEncodingFilter.java
//	web.xml / quiz09.html / PostMethodQuiz09.java / quiz10.html / PostMethodQuiz10.java
	
//	get - 브라우저 주소, a href (주소, 쿼리스트링), form method get
//	    - request 문서 : request body가 없다.
//	post - request parameter 정보가 request body에 담겨져 보내짐
//	     - 내용이 노출되면 안 될 때, 내용이 많을 때
//	     - form으로만 보낼 수 있음 - 브라우저 주소 X, a href X
//	put, delete, ... - post 계열
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		
		String keyword = request.getParameter("keyword");
		
		List<String> list = new ArrayList<>(Arrays.asList(
				"강남역 최고 맛집 소개 합니다.", 
				"오늘 기분 좋은 일이 있었네요.", 
				"역시 맛집 데이트가 제일 좋네요.", 
				"집에 가는 길에 동네 맛집 가서 안주 사갑니다.",
				"자축 저 오늘 생일 이에요."));
		
		PrintWriter out = response.getWriter();
		Iterator<String> iter = list.iterator();
		
		out.print("<html><head><title>검색 결과</title></head><body>");
		
		while (iter.hasNext()) {
			String line = iter.next();
			
			if (line.contains(keyword)) {
				// 1) 단어 자체로 split
//				String[] words = line.split(keyword);
//				out.print(words[0] + "<b>" + keyword + "</b>" + words[1] + "<br>");
				
				// 2) 단어 replace
				line = line.replace(keyword, "<b>" + keyword + "</b>");
				out.print(line + "<br>");
			}
		}
		
		out.print("</body></html>");
	}

}
