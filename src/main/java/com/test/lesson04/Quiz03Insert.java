package com.test.lesson04;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.common.MysqlService;

@WebServlet("/lesson04/quiz03_insert")
public class Quiz03Insert extends HttpServlet {
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		String nickname = request.getParameter("nickname");
		String title = request.getParameter("title");
		String price = request.getParameter("price");
		String description = request.getParameter("description");
		String pictureUrl = request.getParameter("pictureUrl");
		
		MysqlService ms = MysqlService.getInstance();
		ms.connect();
		
		String selectQuery = "select A.*, B.* "
				+ "from `seller` AS A "
				+ "join `used_goods` AS B "
				+ "on A.id = B.sellerId";
		
		int sellerId = 0;
		
		try {
			ResultSet rs = ms.select(selectQuery);
			
			while (rs.next()) {
				sellerId = rs.getInt("A.id");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		String insertQuery = "insert into `used_goods`"
				+ "(`sellerId`, `title`, `description`, `price`, `pictureUrl`)"
				+ "values"
				+ "(" + sellerId + ", '" + title + "', '" + description + "', " + price + ", '" + pictureUrl + "')";
		
		try {
			ms.update(insertQuery);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		ms.disconnect();
		
		response.sendRedirect("/lesson04/quiz03/quiz03.jsp");
	}

}
