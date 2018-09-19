<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/mysqlDBcon.jsp" %>

<%
String unq = request.getParameter("unq");

String selectSQL  = " SELECT title,writer,content FROM nboard WHERE unq='"+unq+"' ";
		
ResultSet rs = stmt.executeQuery(selectSQL);

String title = "";
String writer = "";
String content = "";

while(rs.next()) {
	title = rs.getString("title");
	writer = rs.getString("writer");
	content = rs.getString("content");
}
%>

<!doctype html>
<html>
    <head>
    	<meta charset="utf-8">
        <title>Main</title>
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
    	function fn_submit() {
    		var f = document.frm;
    		if(f.title.value == "") {
    			alert("제목을 입력해 주세요.");
    			f.title.focus();
    			return;
    		}
    		if(f.title.pwd == "") {
    			alert("비밀번호를 입력해 주세요.");
    			f.title.focus();
    			return;
    		}
    		f.submit();
    	}
    </script>
    <body>
        <div id="container">
            <div id="header">Header</div>
            <div id="sidebar">SideBar</div>
            
            <div id="content">
            	<form name="frm" method="post" action="boardModifySave.jsp">
            	<input type="hidden" name="unq" value="<%=unq %>"/>
            		<table border="1" class="board_table">
            			<tr>
            				<th colspan="2">수정</th>
            			</tr>
						<tr>
							<th>제목</th>
							<td><input type="text" name="title" value="<%=title %>"/></td>
						</tr>
						<tr>
							<th>암호</th>
							<td><input type="password" name="pwd" /></td>
						</tr>
						<tr>
							<th>글쓴이</th>
							<td><input type="text" name="writer" value="<%=writer %>"/></td>
						</tr>
						<tr style="margin-top: 10px;">
							<th>내용</th>
							<td><textarea name="content" style="width:99%;height:50px;"><%=content %></textarea></td>
						</tr>
						<tr>
							<td colspan="2">
							<button type="submit" onclick="fn_submit()">저장</button>
							<button type="button" onclick="location='boardList.jsp'">취소</button>
							</td>
						</tr>
					</table>
				</form>
            </div>
            
            <div id="footer">Footer</div>
        </div>
    </body>
</html>