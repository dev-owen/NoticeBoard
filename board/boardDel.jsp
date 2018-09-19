<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/mysqlDBcon.jsp" %>

<%
/* 수정하기 request 작성 */
String unq = request.getParameter("unq");
String pwd = request.getParameter("pwd");
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
if(	   unq == null || unq.equals("")
	|| pwd == null || pwd.equals("")) 
{
%>
	<script>
	alert("다시 시도해주세요.");
	history.back();
	</script>
<%
	return;
}
	String 	deleteSQL = "DELETE FROM nboard WHERE unq='"+unq+"' AND pwd='"+pwd+"'";
	
	int result = stmt.executeUpdate(deleteSQL);
%>

<script>
var cnt = <%=result %>; 
if(cnt > 0) {
	alert("삭제되었습니다.");
	location.href = "boardList.jsp";
} else {
	alert("암호를 다시 확인해주세요.");
	history.back();
}
</script>