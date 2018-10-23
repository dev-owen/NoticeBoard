<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<title>Sign Up</title>
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
    	$("#chkBtn").click(function() {
    		var userid = $("#userid").val();
    		if(userid == "") {
    			alert("아이디를 입력해주세요.");
    			return false;
    		}
    		var url = "idCheck.jsp?userid="+userid;
    		window.open(url,"popup","width=300, height=300");
    	});
    	
    	$("#userid").keydown(function(){
    		document.hiddenFrm.idConfirm.value = "F";
    	});
    	
    	$("#btnReset").keydown(function(){
    		document.hiddenFrm.idConfirm.value = "F";
    	});
    	
    	$("form").submit(function() {
    		
    		var idC = document.hiddenFrm.idConfirm.value;
    		if(idC == "F") {
    			alert("아이디 중복체크를 해 주세요~~");
    			return false;
    		}
    		
    		if($("#userid").val() == "") {
    			alert("아이디를 입력해주세요.");
    			$("#userid").focus();
    			return false;
    		}
    		if($("#userid").val().length < 4 || $("#userid").val().length > 12) {
    			alert("아이디는 4~12자리 이어야 합니다.");
    			return false;
    		}
    		if($("#pwd").val() == "") {
    			alert("패스워드를 입력해주세요.");
    			$("#pwd").focus();
    			return false;
    		}
    		if($("#name").val() == "") {
    			alert("이름을 입력해주세요.");
    			$("#name").focus();
    			return false;
    		}
    		if($("#birthday").val() == "") {
    			alert("생년월일을 입력해주세요.");
    			$("#birthday").focus();
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
            	<form method="post" action="memberWriteSave.jsp">
            		<table border="0" >
            			<tr>
            				<th colspan="3"><h2>회원가입</h2></th>
            			</tr>
						<tr>
							<th>아이디</th>
							<td><input type="text" name="userid" id="userid"></td>
							<td style="padding: 0 20px;"><button type="button" id="chkBtn">중복체크</button></td>
						</tr>
						<tr>
							<th>패스워드</th>
							<td><input type="password" name="pwd"></td>
						</tr>
						<tr>
							<th>이름</th>
							<td><input type="text" name="name"></td>
						</tr>
						<tr>
							<th>생년월일<br>(YYYY-MM-DD)</th>
							<td><input type="text" name="birthday"></td>
						</tr>
						<tr>
							<th>전화번호</th>
							<td><input type="text" name="phoneNum"></td>
						</tr>
						<tr>
							<th>성별</th>
							<td style=>
							
								<input style="width:50px;" type="radio" name="gender" value="M">남성
								<input style="width:50px;" type="radio" name="gender" value="F">여성
							</td>
						</tr>
						<tr>
							<th>우편번호</th>
							<td><input type="text" name="postNum"></td>
							<td style="padding: 0 20px;"><button type="button">찾기</button><td>
						</tr>
						<tr>
							<th>주소(시/구/군)</th>
							<td><input type="text" name="addr1"></td>
							
						</tr>
						<tr>
							<th>상세주소</th>
							<td><input type="text" name="addr2"></td>
						</tr>
					</table>
					<div style="width:100%; text-align: center; padding:10px;">
						<button type="submit" id="btnSubmit">저장</button>
						<button type="reset" id="btnReset">새로고침</button>
					</div>
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

<form name="hiddenFrm">
<input type="hidden" name="idConfirm" id="idConfirm" value="F">
</form>