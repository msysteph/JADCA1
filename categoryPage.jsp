<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import ="java.sql.*"%>  
<%String qsCategory = request.getParameter("category");%>

<!DOCTYPE html>
<html>
<title>Blitz - <%=qsCategory%></title>
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
class="w3-bar-item w3-button">Close Menu</a>
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
	<div class="w3-center w3-padding-16"><%=qsCategory%></div>
  </div>
</div>
  
<!--PAGE CONTENT -->
<div class="w3-main w3-content w3-padding" style="max-width:1200px;margin-top:100px">
	<div class="w3-row-padding w3-padding-16 w3-center">
	
		<%
		
			try{
				Class.forName("com.mysql.jdbc.Driver");
				String connURL = "jdbc:mysql://localhost/drinkshop?user=root&password=root&serverTimezone=UTC";
				Connection conn = DriverManager.getConnection(connURL);
				PreparedStatement stmt = conn.prepareStatement("SELECT id, name, description_short, image_location FROM menu WHERE product_category=?");
				stmt.setString(1,qsCategory);  
				
				
				ResultSet rs = stmt.executeQuery();
			
				while(rs.next()){
					String id = rs.getString(1);
					String name = rs.getString(2);
					String description = rs.getString(3);
					String imageURL = rs.getString(4);
		%>
		
		
	  <!--GRID-->
		    <div class="w3-quarter">
		      <a href= "drinkListing.jsp?id=<%=id%>&name=<%=name%>" style= "text-decoration: none;">
		      	<img src="<%=imageURL%>" alt="drink" style="width:100%">
	     	 	<h3><%=name%></h3>
	     	 </a>
		      <p><%=description%></p>
		    </div>
	  
		<%
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
