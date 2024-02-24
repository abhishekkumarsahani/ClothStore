<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="clothstore.connection.DbCon"%>
<%@page import="java.sql.Connection"%>
<%@include file="adminheader.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Show Products</title>
	<script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>

<style>
h3.alert {
  color: #cc3300;
  text-align: center;
}

h3.success {
  color: #009933;
  text-align: center;
}

h1 {
  color: white;
  text-align: center;
  font-size: 30px;
  background-color: #333;
  padding: 10px;
  margin: 0;
}

table {
  font-family: Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
  margin-top: 20px;
}

td, th {
  border: 1px solid #ddd;
  padding: 8px;
}

th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #333;
  color: white;
}

tr:hover {
  background-color: #f5f5f5;
}

a.edit-link {
  color: #007bff;
  text-decoration: none;
}

a.edit-link:hover {
  text-decoration: underline;
}
</style>
</head>
<body>
<h1>All Products &amp; Edit Products <i class='fab fa-elementor'></i></h1>


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

<table>
  <thead>
    <tr>
      <th>ID</th>
      <th>Name</th>
      <th>Category</th>
      <th>$Price</th>
      <th>Image</th>
      <th>Edit <i class='fas fa-pen-fancy'></i></th>
    </tr>
  </thead>
  <tbody>
  <% 
  try{
	  Connection con = DbCon.getConnection();
	  Statement st = con.createStatement();
	  ResultSet rs = st.executeQuery("select * from products");
	  while(rs.next())
	  {
  %>
    <tr>
      <td><%=rs.getString(1) %></td>
      <td><%=rs.getString(2) %></td>
      <td><%=rs.getString(3) %></td>
      <td>$<%=rs.getString(4) %></td>
      <td><%=rs.getString(5) %></td>
      <td><a href="editProduct.jsp?id=<%=rs.getString(1) %>" class="edit-link">Edit <i class='fas fa-pen-fancy'></i></a></td>
    </tr>
    <% 
    }
    }catch(Exception e){
    	e.printStackTrace();
    }%>
  </tbody>
</table>
</body>
</html>
    