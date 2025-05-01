<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String uiId = request.getParameter("uiId");
String driverClassName = "com.mysql.cj.jdbc.Driver";
Class.forName(driverClassName);

String url = "jdbc:mysql://localhost:3306/dev";
String username = "root";
String pwd = "r1r2r3";
Connection con = DriverManager.getConnection(url,username,pwd);
Statement stmt = con.createStatement();
String sql = "DELETE FORM USER_INFO";
sql+="WHERE UI_ID = '" + uiId + "'";
int result = stmt.executeUpdate(sql);
if(result==1){
%>
<script>
	alert('회원탈퇴에 성공하였습니다.');
	location.href='/';
</script>
<%
}else{
%>
<script>
	alert('회원탈퇴를 실패하였습니다.');
	location.href='/views/user/update';
</script>
<%
}
%>