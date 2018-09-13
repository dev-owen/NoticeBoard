<%@page import="java.sql.ResultSet"%>
<%@ include file="/include/mysqlDBcon.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String userid = request.getParameter("userid");
String sql = "SELECT count(*) cnt FROM member WHERE userid='"+userid+"'";
ResultSet rs = stmt.executeQuery(sql);
int cnt = 0;
while(rs.next()) {
	cnt = rs.getInt("cnt");
}
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중복체크</title>
</head>
<body>
<%
if(cnt == 0) {
	out.print("<p4 style='color:blue'> 사용할 수 있는 아이디입니다.</p4>");
} else {
	out.print("<p4 style='color:red'> 이미 사용중인 아이디입니다.</p4>");
}
%>
<p>
<button type="button" onclick="self.close()">닫기</button>
</body>
</html>