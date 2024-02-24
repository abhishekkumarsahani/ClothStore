<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="clothstore.connection.DbCon"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="adminheader.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<title>Add New Product</title>
		<script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
	
	<!-- Include any necessary CSS files here -->
<style type="text/css">

.container {
	margin: 0 auto;
	max-width: 600px;
	padding: 20px;
}

h2 {
	margin-bottom: 20px;
}

.form-group {
	margin-bottom: 20px;
}

label {
	display: block;
	margin-bottom: 5px;
	font-weight: bold;
}

input[type="text"],
textarea {
	width: 100%;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 4px;
}

input[type="checkbox"] {
	margin-right: 10px;
}

input[type="submit"] {
	background-color: #4CAF50;
	color: #fff;
	padding: 10px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

input[type="submit"]:hover {
	background-color: #45a049;
}
.header {
	background-color: #2c3e50;
	height: 60px;
	display: flex;
	align-items: center;
	justify-content: flex-start;
	padding: 0 30px;
}
.fa-arrow-circle-left, .fa-arrow-alt-circle-right {
	margin-right: 10px;
	font-size: 24px;
}

</style>
</head>
<body>
	<div class="header">
		<h2><a class="back" href="adminHome.jsp"><i class='fas fa-arrow-circle-left'></i> Back</a></h2>
	</div>
	<div class="container">
		<h2>Add New Product</h2>
		<%
		String msg = request.getParameter("msg");
		if ("done".equals(msg)) {
			%>
			<h2>Product Added Successfully</h2>

			<%
			}
			%>
			<%
			if ("wrong".equals(msg)) {
			%>
			<h2>Something Went Wrong! Try Again!</h2>
			<%}%>
			
			<%
		
			int id =1;
			try{
				Connection con = DbCon.getConnection();
				Statement st = con.createStatement();
				ResultSet rs = st.executeQuery("select max(id) from products");
				while(rs.next()){
					id=rs.getInt(1);
					id=id+1;
					
				}
				
			}catch(Exception e){
				
			}
			%>
			<form action="add-new-product" method="post" enctype="multipart/form-data">
			
			<div class="form-group">
				<label for="id">Product ID: <%out.println(id); %></label>
				<input type="text" name="id" value="<%out.println(id);%>" required="required">
			</div>
			<div class="form-group">
				<label for="name">Product Name:</label>
				<input type="text" name="name" id="name" required="required">
			</div>
			<div class="form-group">
				<label for="product_category">Product Category:</label>
				<input type="text" name="category" id="category"  required="required">
			</div>
			<div class="form-group">
				<label for="price">Product Price:</label>
				<input type="number" name="price" id="price"  required="required">
			</div>
			<div class="form-group">
				<label for="image">Product Image:</label>
				<input type="file" name="image" id="image"  required="required">
			</div>
			
			
			<div class="form-group">
				<input type="submit" value="Add Product">
			</div>
		</form>
	</div>
</body>
</html>
