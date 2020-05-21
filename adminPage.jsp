<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import ="java.sql.*"%>  

<!DOCTYPE html>
<html>
<title>Blitz - Admin Page</title>
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
<a href="" onclick="w3_close()" class="w3-bar-item w3-button">Our Drinks</a>
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
	<div class="w3-center w3-padding-16">Admin Page</div>
  </div>
</div>
  
<!--PAGE CONTENT -->
<div class="w3-main w3-content w3-padding" style="max-width:1200px;margin-top:100px">
	<div class="w3-row-padding w3-padding-16 w3-center">
		<div style="margin-top: 20px;"><a href="addProduct.jsp"><button>Add Product</button></a></div>
	
		<%
			if(request.getParameter("statusCode") != null) {
				if(request.getParameter("statusCode").equals("deleteSuccess")) {
		%>
				<p>Product deleted</p>	
		<%
				} else if(request.getParameter("statusCode").equals("updateSuccess")) {
		%>
					<p>Product updated</p>	
		<%
				} else if(request.getParameter("statusCode").equals("addSuccess")) {
		%>
					<p>Product added</p>	
		<%
				}
			}
		
			try{
				Class.forName("com.mysql.jdbc.Driver");
				String connURL = "jdbc:mysql://localhost/drinkshop?user=root&password=root&serverTimezone=UTC";
				Connection conn = DriverManager.getConnection(connURL);
				Statement stmt = conn.createStatement();
				
				String sqlStr = "SELECT * FROM menu;";
				ResultSet rs = stmt.executeQuery(sqlStr);
				
				int count = 0;
			
				while(rs.next()){
					String id = rs.getString(1), 
						   name = rs.getString(2), 
						   description_short = rs.getString(3), 
						   description_long = rs.getString(4), 
						   cost_price = rs.getString(5), 
						   retail_price = rs.getString(6), 
						   stock_quantity = rs.getString(7), 
						   product_category = rs.getString(8), 
						   image_location = rs.getString(9);
					
					if(count == 0) {
						%>
							<div class="w3-row-padding" style="margin-top: 15px;">
						<%
					}
		%>
		
		
	  <!--GRID-->
	    	<div class="w3-quarter">
			      <img src="<%=image_location%>" alt="drink" style="width:100%">
			      <h3>Name:</h3><%=name%>
			      <h3>Short description:</h3><%=description_short%>
			      <h3>Long description:</h3><%=description_long%>
			      <h3>Cost price:</h3><%=cost_price%>
			      <h3>Retail price:</h3><%=retail_price%>
			      <h3>Stock quantity:</h3><%=stock_quantity%>
			      <h3>Product category:</h3><%=product_category%>
			      <div id="updateDeleteProduct" style="margin-top: 8px;">
  						<a href="updateProduct.jsp?id=<%=id%>"><button>Update</button></a>
  						<a href="postProduct.jsp?id=<%=id%>&action=delete"><button>Delete</button></a>
			      </div>		      
		    </div>
	  
		<%
					count++;
					if(count == 4) {
						%>
							</div>
						<%
						count = 0;
					}
				}
				conn.close();
			} catch (Exception e){out.println("Error!" + e);}
		%>
	  </div>
  </div>
  
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