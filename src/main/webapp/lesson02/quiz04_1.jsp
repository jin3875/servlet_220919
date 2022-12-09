<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>계산기</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>
	<%
		int number1 = Integer.valueOf(request.getParameter("number1"));
		String operator = request.getParameter("operator");
		int number2 = Integer.valueOf(request.getParameter("number2"));
		
		double result = 0;
		String printOperator = null;
		
		switch (operator) {
		case "plus":
			result = number1 + number2;
			printOperator = "+";
			break;
		case "minus":
			result = number1 - number2;
			printOperator = "-";
			break;
		case "multiple":
			result = number1 * number2;
			printOperator = "X";
			break;
		case "divide":
			result = (double)number1 / number2;
			printOperator = "÷";
			break;
		}
	%>
	
	<div class="container">
		<h1>계산 결과</h1>
		<div class="display-4">
			<%
				out.print(number1 + " " + printOperator + " " + number2 + " = ");
			%>
			<span class="text-primary"><%= result %></span>
		</div>
	</div>
</body>
</html>