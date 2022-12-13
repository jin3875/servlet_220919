<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<section class="contents">
	<table class="table text-center m-0">
		<thead>
			<tr>
				<th>채널</th>
				<th>채널명</th>
				<th>카테고리</th>
			</tr>
		</thead>
		<tbody>
		<%
			String category = request.getParameter("category");
			
			for (Map<String, String> channel : list) {
				if (category == null || channel.get("category").equals(category)) {
		%>
			<tr>
				<td><%= channel.get("ch") %></td>
				<td><%= channel.get("name") %></td>
				<td><%= channel.get("category") %></td>
			</tr>
		<%
				}
			}
		%>
		</tbody>
	</table>
</section>