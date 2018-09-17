<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!doctype html>
<html>
    <head>
    	<meta charset="utf-8">
        <title>Login</title>
        <link rel="stylesheet" href="../css/main.css">
        <script src="../js/jquery-3.3.1.min.js"></script>
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
            <div id="header">Header</div>
            <div id="sidebar">SideBar</div>
            
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
						<button type="submit">로그인</button>
						<button type="reset">다시입력</button>
					</div>
				</form>
            </div>
            
            <div id="footer">Footer</div>
        </div>
    </body>
</html>