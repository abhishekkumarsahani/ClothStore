<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="clothstore.connection.DbCon"%>
<%@page import="java.sql.Connection"%>
<%@include file="adminheader.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<title>Edit the Product</title>
	<script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	font-family: Arial, sans-serif;
}

.container {
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
	align-items: center;
	padding: 50px;
}

.header {
	background-color: #2c3e50;
	height: 60px;
	display: flex;
	align-items: center;
	justify-content: flex-start;
	padding: 0 30px;
}

.back {
	color: white;
	text-decoration: none;
}

.back:hover {
	color: #3498db;
}

.left-div, .right-div {
	width: 50%;
}

.left-div {
	padding-right: 10px;
}

.right-div {
	padding-left: 10px;
}

h3 {
	font-size: 20px;
	margin-bottom: 10px;
}

hr {
	border: 1px solid #ddd;
	margin-bottom: 20px;
}

.fa-arrow-circle-left, .fa-arrow-alt-circle-right {
	margin-right: 10px;
	font-size: 24px;
}


</style>
</head>
<body>
	<div class="header">
		<h2><a class="back" href="showAllProducts.jsp"><i class='fas fa-arrow-circle-left'></i> Back</a></h2>
	</div>
	<%
		String msg = request.getParameter("msg");
		if ("done".equals(msg)) {
			%>
			<h3 class="success">Product Successfully Updated!</h3>

			<%
			}
			%>
			<%
			if ("wrong".equals(msg)) {
			%>
			<h3 class="alert">Something went wrong! Try again.</h3>
			<%}%>
		
		<%
		String id=request.getParameter("id");
		try{
			Connection con = DbCon.getConnection();
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select * from products where id ='"+id+"'");
			while(rs.next())
			{
		
		%>
		<form action="edit-Product" method="post">
		<input type="hidden" name="id" value="<%out.println(id);%>">
	
		<div class="container">
	
		<div class="left-div">
			<h3>Enter Name</h3>
			<input type="text" name="name" value="<%=rs.getString(2)%>" required="required">
			<hr>
		</div>
		<div class="right-div">
			<h3>Enter Category</h3>
			<input type="text" name="category" value="<%=rs.getString(3)%>" required="required">
			
			<hr>
		</div>
		<div class="left-div">
			<h3>Enter Price</h3>
			<input type="number" name="price" value="<%=rs.getString(4)%>" required="required">
			
			<hr>
		</div>
		<div class="right-div">
			<h3>Add Image</h3>
			<input type="file" name="image" value="<%=rs.getString(5)%>">
			
			<hr>
		</div>
		<button class="button">Save <i class='far fa-arrow-alt-circle-right'></i></button>
		</div>
		</form>
		<% 
		}
		}
		catch(Exception e){
			e.printStackTrace();
		}%>
	
</body>
</html>
    