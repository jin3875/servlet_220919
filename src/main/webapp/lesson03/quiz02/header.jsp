<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="logo col-2 d-flex align-items-center">
	<h3 class="m-0"><a href="/lesson03/quiz02/list_template.jsp" class="text-success">Melong</a></h3>
</div>
<div class="search col-10 d-flex align-items-center">
	<div>
	 	<form method="get" action="/lesson03/quiz02/detail_template.jsp">
			<div class="input-group">
				<input type="text" class="form-control" name="title">
				<div class="input-group-append">
					<button type="submit" class="btn btn-info">검색</button>
				</div>
			</div>
		</form>
	</div>
</div>