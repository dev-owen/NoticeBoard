<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/mysqlDBcon.jsp" %>
<%
String unq = request.getParameter("unq");
String title = request.getParameter("title");
String pwd = request.getParameter("pwd");
String writer = request.getParameter("writer");
String content = request.getParameter("content");
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
%>

<% 
if(	   title == null 
	|| title.equals("")
	|| pwd == null 
	|| pwd.equals(""))
{
%>
	<script>
	alert("다시 시도해주세요.");
	history.back();
	</script>
	
<%
	return;
}
	/*
	 패스워드 일치 검사
	*/
	String selectSQL = "SELECT COUNT(*) cnt FROM nboard WHERE unq="+unq+" AND pwd='"+pwd+"'" ; 
	ResultSet rs = stmt.executeQuery(selectSQL);
	rs.next();
	int cnt = rs.getInt("cnt");
	if(cnt == 0) {
	%>
		<script>
		alert("패스워드를 다시 입력해주세요.");
		history.back();
		</script>
	<%
	return;
	}

String updateSQL = "UPDATE nboard SET title='"+title+"', pwd='"+pwd+"', writer='"+writer+"', content='"+content+"', hit='0', rdate= now() WHERE unq="+unq;
int result = stmt.executeUpdate(updateSQL);

%>
<script>
var cnt = <%=result %>; 
if(cnt > 0) {
	alert("수정되었습니다.");
	location.href = "boardList.jsp";
} else {
	alert("수정실패");
	history.back();
}
</script>