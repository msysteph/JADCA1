<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import ="java.sql.*"%>  
<% 
	String qsID = request.getParameter("id");
	String qsName = request.getParameter("name");
%>

<!DOCTYPE html>
<html>
<title>Blitz - <%=qsName%> </title>
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
	<div class="w3-center w3-padding-16"><%=qsName%></div>
  </div>
</div>
  
  
	<%
		try{
			Class.forName("com.mysql.jdbc.Driver");
			String connURL = "jdbc:mysql://localhost/drinkshop?user=root&password=root&serverTimezone=UTC";
			Connection conn = DriverManager.getConnection(connURL);
			Statement stmt = conn.createStatement();
			
			String sqlStr = "SELECT description_long, retail_price, product_category, image_location FROM menu WHERE id='" + qsID + "';";
			ResultSet rs = stmt.executeQuery(sqlStr);
		
			if(rs.next()){
				String description = rs.getString(1);
				String price = String.format("%.2f",rs.getDouble(2));
				String category = rs.getString(3);
				String imageURL = rs.getString(4);
	%>
	
 <!-- PAGE CONTENT -->
 <div class="w3-container w3-padding-32 w3-center">  
   <img src="<%=imageURL%>" alt="Drink" class="w3-image" style="display:block;margin:auto" width="400" height="533">
   <div class="w3-padding-32">
     <h4><b>$<%=price%></b></h4>
     <p><small><%=category%></small></p>
     <p><%=description%></p>
   </div>
 </div>
 
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
  