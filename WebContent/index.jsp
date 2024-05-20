<%@page import="arduinoTSW.connection.DbCon" %>
<%@page import="arduinoTSW.model.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%
    User auth =(User) request.getSession().getAttribute("auth");
    if(auth!=null){
    	request.setAttribute("auth",auth);
    }
    %>
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