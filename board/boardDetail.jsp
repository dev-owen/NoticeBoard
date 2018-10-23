<%@page import="java.sql.ResultSet"%>
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

String unq = request.getParameter("unq");

String updateSQL = "UPDATE nboard SET hit=hit+1 WHERE unq="+unq;
stmt.executeUpdate(updateSQL);
String selectSQL = "SELECT unq, title, writer, content, DATE_FORMAT(rdate, '%Y-%m-%d') rdate from nboard where unq="+unq;
ResultSet rs = stmt.executeQuery(selectSQL);
rs.next();

String title = rs.getString("title");
String writer = rs.getString("writer");
String content = rs.getString("content");
String rdate = rs.getString("rdate");
%>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>상세정보</title>
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
    input {
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
						<tr>
							<th>작성일</th>
							<td><%=rdate %></td>
						</tr>
						<%
						content = content.replaceAll("\r\n","<br>");
						content = content.replaceAll("\r","<br>");
						content = content.replaceAll("\n","<br>");
						content = content.replaceAll("\u0020","&nbsp&nbsp");
						content = content.replaceAll("`",	"'");
						%>
						<tr style="margin-top: 10px;">
							<th>내용</th>
							<td style="text-align: left; padding: 10px;"><%=content %></td>
						</tr>
						<tr>
							<td colspan="2" style="text-align:center;">
							<button type="button" class="btn btn-success" onclick="location.href='boardList.jsp'">목록</button>
							<button type="button" class="btn btn-warning" onclick="location.href='boardModify.jsp?unq=<%=unq%>'">수정</button>
							<button type="button" class="btn btn-danger" onclick="location='boardPwd.jsp?unq=<%=unq%>'">삭제</button>
							</td>
						</tr>
					</table>
				</form>
            </div>
            
            <div id="footer">Footer</div>
        </div>
    </body>
    <script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/popper.js"></script>
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