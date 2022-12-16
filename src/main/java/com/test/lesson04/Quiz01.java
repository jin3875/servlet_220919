package com.test.lesson04;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.common.MysqlService;

@WebServlet("/lesson04/quiz01")
public class Quiz01 extends HttpServlet {
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("text/plain");
		
		MysqlService mysqlService = MysqlService.getInstance();
		mysqlService.connect();
		
		String insertQuery = "insert into `real_estate`"
				+ "(`realtorId`, `address`, `area`, `type`, `price`, `rentPrice`)"
				+ "values"
				+ "(3, '헤라펠리스 101동 5305호', 350, '매매', 1500000, null)";
		
		try {
			mysqlService.update(insertQuery);
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		
		String selectQuery = "select `address`, `area`, `type` from `real_estate` order by `id` desc limit 10";
		PrintWriter out = response.getWriter();
		
		try {
			ResultSet rs = mysqlService.select(selectQuery);
			
			while (rs.next()) {
				String address = rs.getString("address");
				int area = rs.getInt("area");
				String type = rs.getString("type");
				
				out.println("매물 주소 : " + address + ", 면적 : " + area + ", 타입 : " + type);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		mysqlService.disconnect();
	}

}
