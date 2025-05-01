<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String uiId = request.getParameter("uiId");
String uiName = request.getParameter("uiName");
String uiPwd = request.getParameter("uiPwd");
String uiDesc = request.getParameter("uiDesc");

Connection con = null;
Statement stmt = null;
ResultSet rs = null;

try {
    String driverClassName = "com.mysql.cj.jdbc.Driver";
    Class.forName(driverClassName);

    String url = "jdbc:mysql://localhost:3306/dev";
    String username = "root";
    String pwd = "r1r2r3";
    con = DriverManager.getConnection(url, username, pwd);
    stmt = con.createStatement();
    String sql = "SELECT UI_ID FROM USER_INFO WHERE UI_ID='" + uiId + "'";
    sql += " AND UI_PWD = '" + uiPwd + "'";
    rs = stmt.executeQuery(sql);

    if(rs.next()){
        String name = rs.getString("UI_ID"); // UI_NAME 아니라 UI_ID만 조회 중
%>
<script>
    alert('<%=name%>님 반갑습니다.');
    location.href='/views/user/join';
</script>
<%
    } else {
%>
<script>
    alert('로그인 실패');
    location.href='/views/user/join';
</script>
<%
    }
 } catch(Exception e) {
     out.println("에러: " + e.getMessage());
 }
%>
</body>
</html>
