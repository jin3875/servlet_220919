<%@page import="java.sql.ResultSet"%>
<%@page import="com.test.common.MysqlService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="d-flex justify-content-between mt-3 flex-wrap">
<%
	MysqlService ms = MysqlService.getInstance();
	ms.connect();
	
	String selectQuery = "select A.*, B.* "
			+ "from `seller` AS A "
			+ "join `used_goods` AS B "
			+ "on A.id = B.sellerId "
			+ "order by B.sellerId desc";
	ResultSet rs = ms.select(selectQuery);
	
	while (rs.next()) {
%>
	<div class="box m-3">
		<div class="d-flex justify-content-center m-3">
		<%
			if (rs.getString("B.pictureUrl") != null) {
		%>
			<div><img src="<%= rs.getString("B.pictureUrl") %>" width="300"></div>
		<%
			} else {
		%>
			<div class="image-box d-flex justify-content-center align-items-center">
				<h3 class="text-secondary">이미지 없음</h3>
			</div>
		<%
			}
		%>
		</div>
		<div class="ml-3">
			<div class="font-weight-bold"><%= rs.getString("B.title") %></div>
			<div class="text-secondary"><%= rs.getString("B.price") %>원</div>
			<div class="text-coral"><%= rs.getString("A.nickname") %></div>		
		</div>
	</div>
<%
	}
	
	ms.disconnect();
%>
</div>