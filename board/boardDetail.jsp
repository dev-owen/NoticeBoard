<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/mysqlDBcon.jsp" %>
<%
String unq = request.getParameter("unq");

String updateSQL = "UPDATE nboard SET hit=hit+1 WHERE unq="+unq;
stmt.executeUpdate(updateSQL);
String selectSQL = "SELECT unq, title, writer, content from nboard where unq="+unq;
ResultSet rs = stmt.executeQuery(selectSQL);
rs.next();

String title = rs.getString("title");
String writer = rs.getString("writer");
String content = rs.getString("content");
%>

<!doctype html>
<html>
    <head>
    	<meta charset="utf-8">
        <title>상세정보</title>
        <link rel="stylesheet" href="../css/main.css">
    </head>
     <style>
    table { 
    	text-align: center; 
    	margin: 0 auto;
    }
    tr {
    	height: 50px;
    	margin : 20px 0;
    }
    input, textarea {
    	width: 300px;
    }
    .board_table {
    	border: 1px solid grey;
    	width : 90%;
    }
    </style>
    <script>
    </script>
    <body>
        <div id="container">
            <div id="header">Header</div>
            <div id="sidebar">SideBar</div>
            
            <div id="content">
            	<form name="frm" method="post" action="boardWriteSave.jsp">
            		<table border="1" class="board_table">
            			<tr>
            				<th colspan="2">상세정보</th>
            			</tr>
						<tr>
							<th>제목</th>
							<td><%=title %></td>
						</tr>
						<tr>
							<th>글쓴이</th>
							<td><%=writer %></td>
						</tr>
						<%
						content = content.replaceAll("\r\n","<br>");
						content = content.replaceAll("\r","<br>");
						content = content.replaceAll("\n","<br>");
						content = content.replaceAll("\u0020","&nbsp");
						content = content.replaceAll("`",	"'");
						%>
						<tr style="margin-top: 10px;">
							<th>내용</th>
							<td style="text-align: left;"><%=content %></textarea></td>
						</tr>
						<tr>
							<td colspan="2" style="text-align:center;">
							<button type="button" onclick="location.href='boardList.jsp'">목록</button>
							<button type="button" onclick="location.href='boardModify.jsp?unq=<%=unq%>'">수정</button>
							<button type="button" onclick="location='boardPwd.jsp?unq=<%=unq%>'">삭제</button>
							</td>
						</tr>
					</table>
				</form>
            </div>
            
            <div id="footer">Footer</div>
        </div>
    </body>
</html>