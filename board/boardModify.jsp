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
%>
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
<title>Modify</title>
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
<script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
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
    </body>
</html>