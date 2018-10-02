<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/mysqlDBcon.jsp" %>
<%
	String userid = request.getParameter("userid").trim();
	String pwd = request.getParameter("pwd").trim();
	String name = request.getParameter("name").trim();
	String birthday = request.getParameter("birthday").trim();
	String gender = request.getParameter("gender").trim();
	String postNum = request.getParameter("postNum").trim();
	String addr1 = request.getParameter("addr1").trim();
	String addr2 = request.getParameter("addr2").trim();
	String phoneNum = request.getParameter("phoneNum").trim();
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

if(userid == null || userid.equals("") || pwd == null || pwd.equals("") || name == null || name.equals("")) 
{
%>
	<script>
		alert("다시 시도해주세요.");
		history.back();
	</script>
<%
	return;
}

String insertSql = "INSERT INTO member(userid, pwd, name, birthday, gender, postNum, addr1, addr2, phoneNum, rdate) VALUES('"
+userid+"', '"+pwd+"', '"+name+"', '"+birthday+"', '"+gender+"','"+postNum+"','"+addr1+"','"+addr2+"', '"+phoneNum+"', now())";
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
