<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import ="java.sql.*"%>  

<!DOCTYPE html>
<html>
<title>Blitz - Member Page</title>
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
		String qsID = request.getParameter("id");
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			String connURL = "jdbc:mysql://localhost/drinkshop?user=root&password=root&serverTimezone=UTC";
			Connection conn = DriverManager.getConnection(connURL);
			PreparedStatement stmt = conn.prepareStatement("SELECT id, username, email FROM users WHERE id=?;");
			stmt.setString(1,qsID);
			
			ResultSet rs = stmt.executeQuery();
		
			if(rs.next()){
				String username = rs.getString(2);
				String email = rs.getString(3);
				
	%>
	  
		<!--PAGE CONTENT -->
		<div class="w3-main w3-content w3-padding" style="max-width:1200px;margin-top:100px">
		 <div class="w3-container w3-padding-32 w3-center">  
     		<h2><b>Welcome to your member page, <%=username%>!</b></h2>
   			<div class="w3-padding-32">
			<table border='1'style='margin-left:auto; margin-right:auto; width:25%;border-collapse: collapse;'> 
				<thead><h4>Your User Profile:</h4></thead>   	
				<tr>
					<td>ID</td>
					<td style="text-align: center"><%=qsID%></td>
				</tr>
				
				<tr>
					<td>Username</td>
					<td style="text-align: center"><%=username%></td>
				</tr>
				
				<tr>
					<td>Email</td>
					<td style="text-align: center"><%=email%></td>
				</tr>
			</table>	
			
			<form action="memberPage.jsp?id=<%=qsID%>&update=true" method="post">
		    	<input style="margin-top: 15px;" type="submit" value="edit" name="edit"/>
			</form>		
				
	<%
			}
			conn.close();
		} catch (Exception e){out.println("Error!" + e);}
		
		
	%>
	
			</div>
		</div>
		
		<%
			String updateRequired = request.getParameter("update");
			if(updateRequired != null && updateRequired.equals("true")){
		%>
		
	 	<div class="w3-container w3-padding-32 w3-center">  
		  	<form action="updateUser.jsp" method="post">
		    	 <table style="margin-left: auto; margin-right: auto;">
   	 		  		<thead><h4>Edit Your User Details:</h4>
				     <tr>
				     	<td height="50px" style="padding: 15px;"> <label for="username">Username</label> </td>
				    	<td> <input type="text" id="username" name="username" placeholder="username"> </td>
				     </tr>
				     <tr>
					    <td height="50px" style="padding: 15px;"> <label for="email">Email</label></td>
					    <td><input type="email" id="email" name="email" placeholder="email"> </td>
				    </tr> 
				    <tr>
				    	<td height="50px" style="padding: 15px;"><label for="password">Password</label></td>
				    	<td><input type="password" id="password" name="password" placeholder="password"></td>
					</tr>
				    <tr>
		    			<td>
		    				<input type="hidden" value=<%=qsID%> name= "id"/>
				    		<input type="submit" value="Update">
				    	</td>
				    </tr>
			    </table>
  			</form>
	  	</div>
	  	
	  	<%}%>

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