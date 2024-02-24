<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Online Shopping - Admin Panel</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<style>
		body {
			margin: 0;
			padding: 0;
			background-color: #f1f1f1;
			font-family: Arial, sans-serif;
		}

		/* Header */
		.header {
			background-color: #333;
			color: #fff;
			padding: 20px;
			text-align: center;
		}

		.header h2 {
			margin: 0;
			font-size: 36px;
		}

		/* Navigation */
		.nav {
			background-color: #ddd;
			padding: 10px;
			text-align: center;
			position: sticky;
			top: 0;
		}

		.nav a {
			display: inline-block;
			padding: 10px;
			color: #333;
			text-decoration: none;
			font-size: 18px;
			margin: 0 10px;
		}

		.nav a:hover {
			color: #fff;
			background-color: #333;
			transition: all 0.3s ease-in-out;
		}

		/* Table */
		table {
			margin: 20px auto;
			border-collapse: collapse;
			width: 80%;
			background-color: #fff;
			box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
			border-radius: 10px;
			overflow: hidden;
		}

		th, td {
			padding: 12px 15px;
			text-align: center;
			border-bottom: 1px solid #ddd;
		}

		th {
			background-color: #333;
			color: #fff;
		}

		tr:hover {
			background-color: #f5f5f5;
		}

		/* Font Awesome icons */
		.fa {
			margin-right: 5px;
		}
	</style>
</head>
<body>
	<!-- Header -->
	<div class="header">
		<h2>Online Shopping - Admin Panel</h2>
	</div>

	<!-- Navigation -->
	<div class="nav">
		<a href="addNewProduct.jsp"><i class="fa fa-plus-square"></i> Add New Product</a>
		<a href="showAllProducts.jsp"><i class="fab fa-elementor"></i> All Products and Edit Products</a>
		<a href=""><i class="fa fa-archive"></i> Orders Received</a>
		<a href=""><i class="fa fa-window-close"></i> Cancel Orders</a>
		<a href=""><i class="fa fa-dolly"></i> Delivered Orders</a>
		<a href="login.jsp"><i class="fa fa-share-square"></i> Logout</a>
		<a href="index.jsp"><i class="fa fa-home"></i> Home</a>		
	</div>
</body>
</html>