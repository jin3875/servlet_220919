<%@page import="java.sql.ResultSet"%>
<%@page import="com.test.common.MysqlService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="m-5">
<%
	MysqlService ms = MysqlService.getInstance();
	ms.connect();
	
%>
	<div class="display-4 mb-5">물건 올리기</div>
	<form method="post" action="/lesson04/quiz03_insert">
		<div class="d-flex justify-content-between mb-3">
			<select class="form-control form-select col-3" name="nickname">
				<option selected>-아이디 선택-</option>
			<%
				String selectQuery = "select `nickname` from `seller`";
				ResultSet rs = ms.select(selectQuery);
				
				while (rs.next()) {
			%>
				<option><%= rs.getString("nickname") %></option>
			<%
				}
			%>
			</select>
			<input type="text" class="form-control col-4" placeholder="제목" name="title">
			<div class="input-group col-3 p-0">
				<input type="number" class="form-control" placeholder="가격" name="price">
				<span class="input-group-text">원</span>
			</div>
		</div>
		<textarea class="form-control mb-3" rows="10" name="description"></textarea>
		<div class="input-group mb-3">
			<span class="input-group-text">이미지 url</span>
			<input type="text" class="form-control" name="pictureUrl">
		</div>
		<input type="submit" class="btn w-100" value="저장">
	</form>
<%
	ms.disconnect();
%>
</div>