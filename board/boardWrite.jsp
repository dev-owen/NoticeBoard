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
<title>게시물작성</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">	
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/template.css">
<link href="https://fonts.googleapis.com/css?family=Montserrat|Nanum+Gothic:400,700&amp;subset=korean" rel="stylesheet">
</head>
    <style>
    	/* glyphicon 숨기기 */
		.form-group .glyphicon{
			display: none;
		}
		/* help block 숨기기 */
		.form-group .help-block{
			display: none;
		}

		
		frm {
			margin-left: 160px;
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
            	<form name="frm" method="post" action="boardWriteSave.jsp">
            		<h3>자유게시판</h3><br>
            		<div class="form-group has-feedback">
						<label class="control-label" for="title">제목</label> 
						<input class="form-control" type="text" name="title" id="title"/>
						<p id="msg1" class="help-block">제목을 반드시 입력하세요</p>
					</div>
					<div class="form-group has-feedback row" id="mid">
						<div class="col-sm-6">
							<label class="control-label" for="writer">글쓴이</label> 
							<input class="form-control" type="text" name="writer" id="writer"/>
							<p id="msg2" class="help-block">글쓴이를 반드시 입력하세요</p>						
						</div>
						<div class="col-sm-6">
							<label class="control-label" for="pwd">암호</label> 
							<input class="form-control" type="password" name="pwd" id="pwd"/>
							<p id="msg3" class="help-block">암호를 반드시 입력하세요</p>
						</div>
					</div>
					<div class="form-group has-feedback">
						<label class="control-label" for="content">내용</label> 
						<textarea class="form-control" name="content" id="content" style="height:100px; width:100%;"></textarea>
						<p id="msg4" class="help-block">내용을 반드시 입력하세요</p>
					</div>
					<button class="btn btn-success" type="submit" onclick="fn_submit();return false;">저장</button>
					<button class="btn btn-danger" type="button" onclick="location='boardList.jsp'">취소</button>
					<button class="btn btn-warning" type="reset" onclick="location.reload()">새로고침</button>            			
				</form>
            </div>
            
            <div id="footer">Footer</div>
            
        </div>
    </body>
<script src="../js/jquery-3.3.1.min.js"></script>
<script>
	var isTitleValid = false;
	var isPwdValid = false;
	var isWriterValid = false;

	
	// 제목을 입력 했을때 호출되는 함수 등록 
	$("#title").on("input", function(){
		//입력한 문자열을 읽어온다.
		var inputTitle=$(this).val();
		//초기화
		$(this)
		.parent()
		.removeClass("is-valid is-invalid")
		.hide();
		//만일 아무것도 입력하지 않았다면 
		if(inputTitle==""){
			$(this)
			.parent()
			.addClass("is-invalid")
			.show();
			$("#msg1").show();
			isTitleValid=false;
		}else{//입력을 했으면 
			$(this)
			.parent()
			.addClass("is-valid")
			.show();
			$("#msg1").hide();
			isTitleValid=true;
		}
	});

	// 글쓴이를 입력 했을때 호출되는 함수 등록 
	$("#writer").on("input", function(){
		//입력한 문자열을 읽어온다.
		var inputWriter=$(this).val();
		//초기화
		$(this)
		.parent()
		.removeClass("is-valid is-invalid")
		.hide();
		//만일 아무것도 입력하지 않았다면 
		if(inputWriter==""){
			$(this)
			.parent()
			.addClass("is-invalid")
			.show();
			$("#msg2").show();
			isWriterValid=false;
		}else{//입력을 했으면 
			$(this)
			.parent()
			.addClass("is-valid")
			.show();
			$("#msg2").hide();
			isWriterValid=true;
		}
	});
	
	// 비밀번호를 입력 했을때 호출되는 함수 등록 
	$("#pwd").on("input", function(){
		//입력한 문자열을 읽어온다.
		var inputPwd=$(this).val();
		//초기화
		$(this)
		.parent()
		.removeClass("is-valid is-invalid")
		.hide();
		//만일 아무것도 입력하지 않았다면 
		if(inputPwd==""){
			$(this)
			.parent()
			.addClass("is-invalid")
			.show();
			$("#msg3").show();
			isPwdValid=false;
		}else{//입력을 했으면 
			$(this)
			.parent()
			.addClass("is-valid")
			.show();
			$("#msg3").hide();
			isPwdValid=true;
		}
	});
</script>
</html>