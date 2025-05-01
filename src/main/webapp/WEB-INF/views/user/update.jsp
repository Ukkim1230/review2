<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form id="frm" method ="POST" action="/views/user/update-ok">
	<input type="hidden" name="uiNum" value="<%=session.getAttribute("uiNum") %>">
	<input type="text" name="uiId" value="<%=session.getAttribute("uiId") %>">
	<input type="text" name="uiName" value="<%=session.getAttribute("uiName") %>">
	<input type="text" name="uiDesc" value="<%=session.getAttribute("uiDesc") %>">
	<button>수정</button>
	<button type ="button" onclick="deleteUser()">탈퇴</button>
</form>

<script>
function deleteUser(){
	const frm = document.querySelector('#frm');
	frm.action = '/views/user/delete-ok';
	frm.submit();
}
</script>
</body>
</html>