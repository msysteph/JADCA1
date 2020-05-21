<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import ="java.sql.*"%>  

<!DOCTYPE html>
	<html>
	<title>Blitz - About Us</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Karma">
	<style>
		body,h1,h2,h3,h4,h5,h6 {font-family: "Karma", sans-serif}
		.w3-bar-block .w3-bar-item {padding:20px}
	</style>
	<body>
	
	<!-- SIDEBAR (hidden by default) -->
	<nav class="w3-sidebar w3-bar-block w3-card w3-top w3-xlarge w3-animate-left" style="display:none;z-index:2;width:40%;min-width:300px" id="mySidebar">
	<a href="javascript:void(0)" onclick="w3_close()"
	class="w3-bar-item w3-button">Close</a>
	<a href="listingPage.jsp" onclick="w3_close()" class="w3-bar-item w3-button">Our Drinks</a>
	<a href="categoryPage.jsp?category=Bubble teas" onclick="w3_close()" class="w3-bar-item w3-button">Bubble teas</a>
	<a href="categoryPage.jsp?category=Kombuchas" onclick="w3_close()" class="w3-bar-item w3-button">Kombuchas</a>
	<a href="categoryPage.jsp?category=Milkshakes" onclick="w3_close()" class="w3-bar-item w3-button">Milkshakes</a>
	<a href="registrationForm.jsp" onclick="w3_close()" class="w3-bar-item w3-button">Register As Member</a>
	<a href="loginForm.jsp" onclick="w3_close()" class="w3-bar-item w3-button">Login</a>
	</nav>
	
	<!-- TOP MENU -->
	<div class="w3-top">
	  <div class="w3-white w3-xlarge" style="max-width:1200px;margin:auto">
	  	<a href="index.html" style="text-decoration:none"><div class="w3-center w3-padding-16">Blitz</div></a>
		<div class="w3-button w3-padding-16 w3-left" onclick="w3_open()">Search</div>
	  </div>
	</div>
	<%
		try{
			Class.forName("com.mysql.jdbc.Driver");
			String connURL = "jdbc:mysql://localhost/drinkshop?user=root&password=root&serverTimezone=UTC";
			Connection conn = DriverManager.getConnection(connURL);
			
			PreparedStatement stmt = conn.prepareStatement("SELECT * FROM menu WHERE id=?;");
			stmt.setString(1, request.getParameter("id"));
			ResultSet rs = stmt.executeQuery();
		
			while(rs.next()){
				String id = rs.getString(1);
				String name = rs.getString(2);
				String description_short = rs.getString(3);
				String description_long = rs.getString(4);
				String cost_price = rs.getString(5);
				String retail_price = rs.getString(6);
				String stock_quantity = rs.getString(7);
				String product_category = rs.getString(8);
				String image_location = rs.getString(9);
			
	%>
	<form method="post" action="postProduct.jsp?action=update" style="margin-left: 40%; margin-top: 5%">
		<p><h3>Product update</h3></p>
		
		<div class="w3-quarter">
		      <img src="<%=image_location%>" alt="drink" style="width:100%">
		      ID: <br>
		      <input type="text" name="id" value="<%=id%>" readonly><br><br>
		      
		      Name: <br>
		      <input type="text" name="name" value="<%=name%>" ><br><br>
		      
		      Description short: <br>
		      <input type="text" name="description_short" value="<%=description_short%>" ><br><br>
		      
		      Description long: <br>
		      <input type="text" name="description_long" value="<%=description_long%>" ><br><br>
		      
		      Cost price: <br>
		      <input type="text" name="cost_price" value="<%=cost_price%>" ><br><br>
		      
		      Retail price: <br>
		      <input type="text" name="retail_price" value="<%=retail_price%>" ><br><br>
		      
		      Stock quantity: <br>
		      <input type="text" name="stock_quantity" value="<%=stock_quantity%>" ><br><br>
		      
		      Product category: <br>
		      <select name="product_category">
		      	<option value="Bubble teas">Bubble teas</option>
		      	<option value="Kombuchas">Kombuchas</option>
		      	<option value="Milkshakes">Milkshakes</option>
		      </select><br><br>
		      
		      Image URL: <br>
		      <input type="text" name="image_location" value="<%=image_location%>"><br><br>
		      
		      <input type="submit" value="Submit">
	    </div>
	</form>
	
	<% 
			}
			conn.close();
		} catch (Exception e){out.println("Error!" + e);}
	%>
	
	<script>
	// Script to open and close sidebar
	function w3_open() {
	  document.getElementById("mySidebar").style.display = "block";
	}
	 
	function w3_close() {
	  document.getElementById("mySidebar").style.display = "none";
	}
	</script>
	
	</body>
</html>