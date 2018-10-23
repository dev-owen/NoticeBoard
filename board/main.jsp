<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ include file="/include/mysqlDBcon.jsp" %>
<%
String sessionId = (String)session.getAttribute("SESSION_ID");
boolean login = (sessionId == null ? false : true);
String signIn = "";
if(login) {
	signIn = sessionId; 
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main Page</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">	
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/template.css">
<link href="https://fonts.googleapis.com/css?family=Montserrat|Nanum+Gothic:400,700&amp;subset=korean" rel="stylesheet">
<style>
	#content {
		padding-top: 15%;
		padding-bottom: 15%;
	}
</style>
</head>
<body>
	<div id="container">
        <div id="header">
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
			 	<a class="navbar-brand" href="${pageContext.request.contextPath}/index.jsp"><i class="fas fa-chalkboard"></i>&nbsp;Header</a>
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
			<p id="front">My First Project</p>
			<button type="button" class="btn btn-outline-dark" onclick="location.href='boardList.jsp'">게시판 보러가기</button>
		</div>
		<div id="footer">
		</div>
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