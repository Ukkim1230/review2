<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>회원가입<h3>
<form action="/views/user/join-ok" method="POST">
	<input type="text" name="uiId"><br>
	<input type="password" name="uiPwd"><br>
	<input type="text" name="uiName"><br>
	<input type="text" name="uiDesc"><br>
	<button>가입요청</button>
</form>
</body>
</html>