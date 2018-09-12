<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/mysqlDBcon.jsp" %>

<%
String column = request.getParameter("column");
String words = request.getParameter("words");
String pageNo = request.getParameter("pageNo");

if(pageNo == null || pageNo == "") pageNo = "1";

int lastNo = Integer.parseInt(pageNo)*10;
int startNo = lastNo - 9;

String where = "";
if( column != null && words != null && !column.equals("") && !words.equals("")) where = "WHRER "+column+" LIKE '%"+words+"%'";
else {
	column = "";
	words = "";
}

String countSql = "SELECT count(*) cnt FROM nBoard";
ResultSet rs = stmt.executeQuery(countSql);
rs.next();
int total = rs.getInt("cnt");
int number = total - (Integer.parseInt(pageNo)-1)*10;
int totalPage = (int) Math.ceil(total/(double)10);

String listSql = "SELECT b.* FROM (SELECT @ROWNUM := @ROWNUM + 1 as rn, a.* FROM "+
"(SELECT unq, title, writer, hit, content, DATE_FORMAT(rdate, '%Y-%m-%d') rdate FROM nBoard "+
"ORDER BY unq DESC) a, (SELECT @ROWNUM := 0) c ) b WHERE rn >= "+startNo+" and rn <= "+lastNo;

ResultSet rs2 = stmt.executeQuery(listSql);
%>

<!doctype html>
<html>
    <head>
    	<meta charset="utf-8">
        <title>List</title>
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
    <body>
        <div id="container">
            <div id="header">Header</div>
            <div id="sidebar">SideBar</div>
            
            <div id="content">
            	<div>
	            	<form name="frm" method="post" action="boardList.jsp">
	            		<table border="0" width: 100%>
	            			<colgroup>
	            				<col width="80%"/>
	            				<col width="20%"/>
	            			</colgroup>
	            			<tr>
	            				<td style="text-align: left">
		            				<select name="column" style="height:22px;">
		            					<option value="title" <%if(column.equals("title")){%>selected<%} %>> 제목 </option>
		            					<option value="content" <%if(column.equals("content")){%>selected<%} %>> 내용 </option>
		            				</select>
	            					<input type="text" name="words" value="<%=words %>"/>
	            					<button type="submit">검색</button>
	            				</td>
	            				<td>
	            					<button type="button" onclick="location.href='boardWrite.jsp'">글쓰기</button>
	            				</td>
	            			</tr>
						</table>
					</form>
				</div>
				<table class="board_table" border="1">
					<colgroup>
						<col width="15%">
						<col width="30%">
						<col width="20%">
						<col width="20%">
						<col width="15%">
					</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>글쓴이</th>
							<th>등록일</th>
							<th>조회수</th>
						</tr>
					</thead>
					<tbody>
						<%
						while(rs2.next()) {
							String unq = rs2.getString("unq");
						%>
						<tr>
							<td><%=number%></td>
							<td><a href="boardDetail.jsp?unq=<%=unq%>">
							<%=rs2.getString("title")%></a></td>
							<td><%=rs2.getString("writer") %></td>
							<td><%=rs2.getString("rdate") %></td>
							<td><%=rs2.getString("hit") %></td>
						</tr>
						<%
							number--;
						}
						%>
					</tbody>
				<table>
				<table style="width:100%">
					<tr>
						<td>
						<% for(int i=1; i<totalPage; i++) {%>
						<a href="noticeList.jsp?pageNo=<%=i %>"><%=i %></a>
						<%
						}
						%>
						</td>
					</tr>
				</table>
            </div>
            
            <div id="footer">Footer</div>
        </div>
    </body>
</html>