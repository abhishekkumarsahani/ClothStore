<!DOCTYPE html>
<html>
<head>
<title>Forgot Password</title>
<link rel="stylesheet" href="css/style1.css">
</head>
<body>
	<div class="container">
		<div class="form-container">
			<h1>Forgot Password</h1>
			<p>Enter your email and mobile number to reset your password.</p>
			<form action="forgotPassword" method="post">
				<div class="form-input">
					<label for="email">Email:</label> <input type="email" name="email"
						id="email" required>
				</div>
				<div class="form-input">
					<label for="mobile">Mobile Number:</label> <input type="number"
						name="mobile" id="mobile" required>
				</div>
				<div class="form-input">
					<label for="newpassword">New Password:</label> <input
						type="password" name="newpassword" id="newpassword" required>
				</div>
				<div class="form-input">
					<button type="submit" class="btn-submit">Save</button>
				</div>
			</form>
			<p>
				Remember your password? <a href="login.jsp">Login</a>
			</p>
		</div>
		<div class="info-container">
			<%
			String msg = request.getParameter("msg");
			if ("done".equals(msg)) {
			%>
			<h2>Password Changed Successfully</h2>

			<%
			}
			%>
			<%
			if ("invalid".equals(msg)) {
			%>
			<h2>Something Went Wrong! Try Again!</h2>
			<%
			}
			%>
			<h2>Welcome to our online shopping store</h2>

			<p>Our online shopping system is designed to make your shopping
				experience as easy and convenient as possible. Browse our wide
				selection of products from the comfort of your own home, and have
				them delivered right to your doorstep.</p>
		</div>
	</div>
</body>
</html>
