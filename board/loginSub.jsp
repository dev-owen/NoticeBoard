<%@ include file="/include/mysqlDBcon.jsp" %>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%
String userid = request.getParameter("userid");
String pwd = request.getParameter("pwd");

String sql = "SELECT COUNT(*) cnt FROM member WHERE userid = '"+userid+"' AND pwd='"+pwd+"'";
ResultSet rs = stmt.executeQuery(sql);
int cnt = 0;
while(rs.next()) {
	cnt = rs.getInt("cnt");
}
if(cnt == 0) {
%>
	<script>
	alert("일치하는 정보가 없습니다.");
	history.back();
	</script>
<%	
	return;
} else {
	session.setAttribute("SESSION_ID", userid);
	session.setMaxInactiveInterval(60*20);
}
%>
<script>
	alert("<%=userid%>님 환영합니다.");
	location.href="boardList.jsp";
</script>
