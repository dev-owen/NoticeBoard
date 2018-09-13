<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!doctype html>
<html>
    <head>
    	<meta charset="utf-8">
        <title>Sign Up</title>
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
            <div id="header">Header</div>
            <div id="sidebar">SideBar</div>
            
            <div id="content">
            	<form method="post" action="memberWriteSave.jsp">
            		<table border="0" >
            			<tr>
            				<th colspan="3"><h2>회원가입</h2></th>
            			</tr>
						<tr>
							<th>아이디</th>
							<td><input type="text" name="userid" id="userid"></td>
							<td style="padding: 0 20px;"><button type="button">중복체크</button><td>
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
						<button type="reset">새로고침</button>
					</div>
				</form>
            </div>
            
            <div id="footer">Footer</div>
        </div>
    </body>
</html>