<%@page import="clothstore.connection.DbCon"%>
<%@page import="java.util.List"%>
<%@page import="clothstore.dao.*"%>
<%@page import="clothstore.model.copy.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%


	if(session.getAttribute("name")==null){
		response.sendRedirect("login.jsp");
		return;
	}
ProductDao pd = new ProductDao(DbCon.getConnection());
List <Product> products = pd.getAllProducts();

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
<title>Index Page</title>
<%@include file="include/header.jsp" %>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
</head>
<body>
<%@include file="include/navbar.jsp" %>

<div class="container">
		<div class="card-header my-3">All Products</div>
		<div class="row">
		<%
			if(!products.isEmpty()){
				for(Product p:products){%>
					
					<div class="col-md-3 my-3" >
					<div class="card w-100" style="width: 18rem; height: 33rem" >
						<div class="card w-100" style="width: 18rem;">
							<img class="card-img-top" style="height: 20rem" src="product-images/<%=p.getImage() %>" alt="Card image cap">
						</div>
						<div class="card-body" style="height: 7rem">
							<h5 class="card-title"><%=p.getName()%></h5>
							<h6 class="price">Price:$<%=p.getPrice() %></h6>
							<h6 class="category">Category:<%=p.getCategory() %></h6>
						</div>
							<div class="mt-3 d-flex justify-content-between" style="padding-left: 0.4rem; padding-right: 0.4rem; padding-bottom: 0.3rem">
								<a href="add-to-cart?id=<%=p.getId() %>" class="btn btn-dark">Add to Cart</a>
								<a href="#" class="btn btn-primary">Buy Now</a>
							</div>
					</div>
						
					

				</div> 
				<%}
			}
		
		%>
		
		</div>
	</div>





<%@include file="include/footer.jsp" %>

</body>
</html>