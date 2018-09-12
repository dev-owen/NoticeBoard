<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!doctype html>
<html>
    <head>
    	<meta charset="utf-8">
        <title>Main</title>
        <link rel="stylesheet" href="../css/main.css">
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
            <div id="header">Header</div>
            <div id="sidebar">SideBar</div>
            
            <div id="content">
            	<form name="frm" method="post" action="boardWriteSave.jsp">
            		<table border="0" >
            			<tr>
            				<th colspan="2">자유게시판</th>
            			</tr>
						<tr>
							<th>제목</th>
							<td><input type="text" name="title"></td>
						</tr>
						<tr>
							<th>암호</th>
							<td><input type="password" name="pwd"></td>
						</tr>
						<tr>
							<th>글쓴이</th>
							<td><input type="text" name="writer"></td>
						</tr>
						<tr style="margin-top: 10px;">
							<th>내용</th>
							<td><textarea name="content" style="height:100px;"></textarea></td>
						</tr>
						<tr>
							<th colspan="2">
							<button type="submit" onclick="fn_submit();return false;">저장</button>
							</th>
						</tr>
					</table>
				</form>
            </div>
            
            <div id="footer">Footer</div>
        </div>
    </body>
</html>