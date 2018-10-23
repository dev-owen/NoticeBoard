<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% session.removeAttribute("SESSION_ID"); %>
<script>
alert("로그아웃 됐습니다.");
location.href="history.back()";
</script>