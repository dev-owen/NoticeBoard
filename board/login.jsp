<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include/mysqlDBcon.jsp" %>
<%
String sessionId = (String)session.getAttribute("SESSION_ID");
boolean login = (sessionId == null ? false : true);
String signIn = "";
if(login) {
	signIn = sessionId; 
}
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Login</title>
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
th {
	padding: 0 20px;
}
tr {
	height: 40px;
}
input {
	width: 200px;
}
</style>
    <script>
    $(function() {
    	$("form").submit(function() {
    		if($("#userid").val() == "") {
    			alert("아이디를 입력해주세요.");
    			$("#userid").focus();
    			return false;
    		}
    		if($("#pwd").val() == "") {
    			alert("패스워드를 입력해주세요.");
    			$("#pwd").focus();
    			return false;
    		}
    	});
    });
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
            	<form method="post" action="loginSub.jsp">
            		<table border="0" >
            			<tr>
            				<th colspan="2"><h2>로그인</h2></th>
            			</tr>
						<tr>
							<th>아이디</th>
							<td><input type="text" name="userid" id="userid" maxlength="20"/></td>
						</tr>
						<tr>
							<th>패스워드</th>
							<td><input type="password" name="pwd" id="pwd" maxlength="20"/></td>
						</tr>
					</table>
					<div style="width:100%; text-align: center; padding:10px;">
						<button class="btn btn-success"type="submit">로그인</button>
						<button class="btn btn-warning" type="reset">다시입력</button>
					</div>
				</form>
            </div>
            
            <div id="footer">Footer</div>
        </div>
    <script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/js/popper.min.js"></script>
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