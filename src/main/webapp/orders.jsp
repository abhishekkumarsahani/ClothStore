<%@page import="clothstore.connection.DbCon"%>
<%@page import="java.util.List"%>
<%@page import="clothstore.dao.*"%>
<%@page import="clothstore.model.copy.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%

//This is use here to get the number of products present in cart 

ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
if(cart_list != null){
	request.setAttribute("cart_list", cart_list);
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Orders Page</title>
<%@include file="include/header.jsp" %>

</head>
<body>
<%@include file="include/navbar.jsp" %>

<%@include file="include/footer.jsp" %>

</body>
</html>