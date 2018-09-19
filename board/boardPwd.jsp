<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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

<!doctype html>
<html>
  <head>
    <meta charset="utf-8">
    <title>삭제화면</title>
	<link rel="stylesheet" href="/css/main.css">
  </head>
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

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 확인</title>
<link rel="stylesheet" href="../css/main.css">
</head>
<body onload="document.frm.title.focus();">
<div id="container">
	<div id="header"></div>
	<div id="sidebar"></div>
	<div id="content">
	<form name="frm" method="post" action="boardDel.jsp">
	<input type="hidden" name="unq" value="<%=unq %>"/>
	<table class="board_table">
		<tr>
			<th>암호
			<input type="password" name="pwd">
			<button type="submit" onclick="fn_submit(); return false;">적용</button>
			</th>
		</tr>
	</table>
	</form>
	</div>
	<div id="footer"></div>
</div>
</body>
</html>