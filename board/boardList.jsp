<%@ page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/mysqlDBcon.jsp" %>

<%
String sessionId = (String)session.getAttribute("SESSION_ID");
boolean login = (sessionId == null ? false : true);
String signIn = "";
if(login) {
	signIn = sessionId; 
}
String column = request.getParameter("column");
String words = request.getParameter("words");
String pageNo = request.getParameter("pageNo");

if(pageNo == null || pageNo == "") pageNo = "1";

int lastNo = Integer.parseInt(pageNo)*10;
int startNo = lastNo - 9;

String where = "";
if( column != null && words != null && !column.equals("") && !words.equals("")) where = column+" LIKE '%"+words+"%'";
else {
	column = "";
	words = "";
}
String countSql;
if(where == "") {
	countSql = "SELECT count(*) cnt FROM nBoard";
} else {
	countSql = "SELECT count(*) cnt FROM nBoard WHERE "+where;
}

ResultSet rs = stmt.executeQuery(countSql);
rs.next();
int total = rs.getInt("cnt");
int number = total - (Integer.parseInt(pageNo)-1)*10;
int totalPage = (int) Math.ceil(total/(double)10);

String listSql;
if(where == "") {
	listSql = "SELECT b.* FROM (SELECT @ROWNUM := @ROWNUM + 1 as rn, a.* FROM "+
	"(SELECT unq, title, writer, hit, content, DATE_FORMAT(rdate, '%Y-%m-%d') rdate FROM nBoard "+
	"ORDER BY unq DESC) a, (SELECT @ROWNUM := 0) c ) b WHERE rn >= "+startNo+" and rn <= "+lastNo;
} else {
	listSql = "SELECT b.* FROM (SELECT @ROWNUM := @ROWNUM + 1 as rn, a.* FROM "+
	"(SELECT unq, title, writer, hit, content, DATE_FORMAT(rdate, '%Y-%m-%d') rdate FROM nBoard "+
	"ORDER BY unq DESC) a, (SELECT @ROWNUM := 0) c ) b WHERE rn >= "+startNo+" and rn <= "+lastNo+" and "+where;
}
ResultSet rs2 = stmt.executeQuery(listSql);
%>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>List</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">	
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/template.css">
<link href="https://fonts.googleapis.com/css?family=Montserrat|Nanum+Gothic:400,700&amp;subset=korean" rel="stylesheet">
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
            <div id="header">
            	<nav class="navbar navbar-expand-lg navbar-light bg-light">
				 	<a class="navbar-brand" href="../index.jsp"><i class="fas fa-chalkboard"></i>&nbsp;Header</a>
				 	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
				    <span class="navbar-toggler-icon"></span>
				  	</button>
				  	<div class="collapse navbar-collapse" id="navbarNav">
				    	<ul class="navbar-nav">
				      		<li class="nav-item active">
				        		<a class="nav-link" href="#"><%=signIn%><span class="sr-only">(current)</span></a>
				      		</li>
				      		<li class="nav-item">
				        		<a class="nav-link" id="login" href="login.jsp">로그인</a>
				      		</li>
				      		<li class="nav-item">
				        		<a class="nav-link" id="logout" href="logout.jsp">로그아웃</a>
				      		</li>
				      		<li class="nav-item">
				        		<a class="nav-link" id="signup" href="memberWrite.jsp">회원가입</a>
				      		</li>
				    	</ul>
				  	</div>
				</nav>
            </div>            
            <div id="content">
            	<div>
	            	<form name="frm" method="post" action="boardList.jsp">
	            		<table class="table table-striped table-bordered">
	            			<colgroup>
	            				<col width="80%"/>
	            				<col width="20%"/>
	            			</colgroup>
	            			<tr>
	            				<td style="text-align: left">
	            					<div class="input-group mb-2">
									  <div class="input-group-prepend">
									    <button name="column" class="btn btn-outline-secondary dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Dropdown</button>
									    <div class="dropdown-menu">
									      <a class="dropdown-item" value="title" <%if(column.equals("title")){%>selected<%} %>>제목</a>
									      <a class="dropdown-item" value="content" <%if(column.equals("content")){%>selected<%} %>>내용</a>
									    </div>
									  </div>
									  <input type="text" class="form-control" aria-label="Text input with dropdown button" value="<%=words%>">
	            					<button type="submit" class="btn btn-info"><i class="fas fa-search"></i>&nbsp;검색</button>
									</div>
		            				<!--<select name="column" style="height:22px;">
		            					<option value="title" <%if(column.equals("title")){%>selected<%} %>>제목</option>
		            					<option value="content" <%if(column.equals("content")){%>selected<%} %>>내용</option>
		            				</select>
	            					<input type="text" name="words" value="<%=words %>"/>
	            					<button type="submit" class="btn btn-info">검색</button>-->
	            				</td>
	            				<td>
	            					<button type="button" class="btn btn-dark" onclick="location.href='boardWrite.jsp'">글쓰기</button>
	            				</td>
	            			</tr>
						</table>
					</form>
				</div>
				<table class="table table-striped table-bordered">
					<colgroup>
						<col width="15%">
						<col width="30%">
						<col width="20%">
						<col width="20%">
						<col width="15%">
					</colgroup>
					<thead style="color: #6d2b2b;">
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
						<% for(int i=1; i<=totalPage; i++) {%>
						<a href="boardList.jsp?pageNo=<%=i %>"><%=i %></a>
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
    <script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/popper.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
    <script>
    
    	if(<%=login%>) {
    		$("#login").parent().hide();
    		$("#logout").parent().show();
    		$("#signup").parent().hide();
    	} else {
    		$("#login").parent().show();
    		$("#logout").parent().hide();
    		$("#signup").parent().show();    		
    	}
    </script>
</html>