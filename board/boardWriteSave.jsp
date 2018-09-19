<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/mysqlDBcon.jsp" %>
<%
String title = request.getParameter("title");
String pwd = request.getParameter("pwd");
String writer = request.getParameter("writer");
String content = request.getParameter("content");
content = content.replaceAll("'","`");
String method = request.getMethod();

if(!method.equals("POST")) {
%>
	<script>
	alert("정상 접근이 아닙니다.");
	history.back();
	</script>
<%
	return;
}

String insertSql = "INSERT INTO nBoard(title, pwd, content, writer, rdate, hit) values('"+title
+"', '"+pwd+"', '"+content+"', '"+writer+"', now(), 0)";

int result = stmt.executeUpdate(insertSql);
%>
<script>
var cnt = <%=result %>; 
if(cnt > 0) {
	alert("저장되었습니다.");
	location.href = "boardList.jsp";
} else {
	alert("저장실패");
	history.back();
}
</script>
