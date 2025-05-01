<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<%
String uiId = request.getParameter("uiId");//공부필요
String uiName = request.getParameter("uiName");
String uiPwd = request.getParameter("uiPwd");
String uiDesc = request.getParameter("uiDesc");
//데이터 베이스 커넥션 만들어서
//uiId가 중복이면 중복이 됐다고 메세지 띄우고
//uiId가 중복이 아니면 USER_INFO에 INSERT 한뒤
//가입완료가 되었다고 메세지 띄우면 됩니다.
String driverClassName = "com.mysql.cj.jdbc.Driver";
Class.forName(driverClassName);

String url = "jdbc:mysql://localhost:3306/dev";
String username = "root";
String pwd = "r1r2r3";
Connection con = DriverManager.getConnection(url,username,pwd);
Statement stmt = con.createStatement();
String sql = "SELECT UI_ID FROM USER_INFO WHERE UI_ID='" + uiId + "'";
ResultSet rs = stmt.executeQuery(sql);
if(rs.next()){
%>
<script>
	alert('<%=uiId%>는 이미 존재하는 아이디입니다.');
	location.href='/views/user/join';
</script>
<%
}else{
	sql = "INSERT INTO USER_INFO(UI_ID, UI_PWD, UI_NAME, UI_DESC)";
	sql += "VALUES('" + uiId + "','" + uiPwd + "','" + uiName + "','" + uiDesc+"')";
	int result = stmt.executeUpdate(sql);
	if(result==1){
%>
<script>
	alert('<%=uiName%>님 회원가입에 성공하였습니다.');
	location.href='/';
</script>
<%
	}
}
%>
니가 쓴 아이디 : <%=uiId%><br>
니가 쓴 비밀번호 : <%=uiPwd%><br>
니가 쓴 이름 : <%=uiName%><br>
니가 쓴 소개 : <%=uiDesc%><br>