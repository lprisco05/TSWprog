<%@page import="arduinoTSW.connection.DbCon" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
<%@include file="includes/header.jsp" %>
</head>
<body>
<%@include file="includes/NavBar.jsp" %>

<% out.print(DbCon.getConnection()); %>

<%@include file="includes/footer.jsp" %>
</body>
</html>