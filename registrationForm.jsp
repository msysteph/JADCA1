<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import ="java.sql.*"%>  


<!DOCTYPE html>
<html>
<title>Blitz - Register As Member</title>
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
	<div class="w3-center w3-padding-16">Register As Member</div>
  </div>
</div>

<!-- PAGE CONTENT -->
<div class="w3-main w3-content w3-padding" style="max-width:1200px;margin-top:100px">
 <div class="w3-container w3-padding-32 w3-center">  
   <div class="w3-padding-3">
      <img src="https://st2.depositphotos.com/3591429/9018/i/950/depositphotos_90189570-stock-photo-businessman-filling-up-form-on.jpg" alt="Drink" class="w3-image" style="display:block;margin:auto" width="400" height="533">
     <p> Register as a member to get your drinks delivered right to your doorstep! You will be notified on promotions and all the latest happenings in Blitz as well. </p>
     <p><small> Your information is kept strictly confidential. </small></p>
   </div>
   
   <div>
   <%
	   String status = request.getParameter("statusCode");
		if (status != null){
	%>
     		<p><b>You have successfully registered! Please log in!</b></p>
	<%	} %>
	
	  <form action="postUser.jsp" method="post">
	     <table style="margin-left: auto; margin-right: auto;">
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
		    	<td><input type="submit" value="Register"></td>
		    </tr>
	    </table>
	  </form>
  </div>
  
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