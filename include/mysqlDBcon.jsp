<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Statement stmt = null;
try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn =DriverManager.getConnection
	("jdbc:mysql://localhost:3306/acorn2?useUnicode=true&characterEncoding=utf8","root","apmsetup");
	stmt = conn.createStatement();
} catch (Exception e) {}
%>

<% request.setCharacterEncoding("UTF-8"); %>