<%@ page import="java.sql.*" %>
<%
String uiId = request.getParameter("uiId");
String uiName = request.getParameter("uiName");
String uiPwd = request.getParameter("uiPwd");
String uiDesc = request.getParameter("uiDesc");

Connection con = null;
PreparedStatement pstmt = null;

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dev", "root", "r1r2r3");

    String sql = "UPDATE USER_INFO SET UI_NAME=?, UI_PWD=?, UI_DESC=? WHERE UI_ID=?";
    pstmt = con.prepareStatement(sql);
    pstmt.setString(1, uiName);
    pstmt.setString(2, uiPwd);
    pstmt.setString(3, uiDesc);
    pstmt.setString(4, uiId);

    int result = pstmt.executeUpdate();
    if (result > 0) {
%>
<script>
    alert("회원 정보가 수정되었습니다.");
    location.href="/"; // 원하는 리다이렉트 경로
</script>
<%
    } else {
%>
<script>
    alert("회원 정보 수정 실패");
    history.back();
</script>
<%
    }
} catch(Exception e) {
    e.printStackTrace();
}
finally {
    try { if (pstmt != null) pstmt.close(); } catch(Exception e) {}
    try { if (con != null) con.close(); } catch(Exception e) {}
}
%>
