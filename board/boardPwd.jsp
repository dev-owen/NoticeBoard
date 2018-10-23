<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

if(unq == null) {
%>
	<script>
	alert("다시 시도 해주세요.");
	history.back();
	</script>
<%
	return;
}

%>

<script>

function fn_submit() {
	var f = document.frm;
	if(f.pwd.value == "") {
		alert("암호를 입력해주세요.");
		f.pwd.focus();
		return false;
	}
	f.submit();
}
</script>

<style>
	@media(min-width: 768px) {
		#pwdCk {
			width: 650px;
			margin-left: auto;
			margin-right: auto;
		}
	}

</style>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 확인</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">	
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/template.css">
<link href="https://fonts.googleapis.com/css?family=Montserrat|Nanum+Gothic:400,700&amp;subset=korean" rel="stylesheet">
</head>
<body onload="document.frm.title.focus();">
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
		<form name="frm" method="post" action="boardDel.jsp">
			<div class="form-group" style="align: center;">
				<input type="hidden" name="unq" value="<%=unq%>"/>
				<label for="pwd" style="font-weight: 700; color: #6d2b2b; font-family: 'Montserrat', sans-serif; font-size: 25px;">암호</label>
				<input id="pwdCk" class="form-control" type="password" name="pwd">
			</div>
				<button type="submit" class="btn btn-danger">삭제</button>
		</form>
	</div>
	<div id="footer"></div>
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