<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import ="java.sql.*"%>  

<!DOCTYPE html>
<html>
<title>Blitz - Details Updated</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Karma">
<style>
	body,h1,h2,h3,h4,h5,h6 {font-family: "Karma", sans-serif}
	.w3-bar-block .w3-bar-item {padding:20px}
</style>
<body>
	<%
		String idStr = request.getParameter("id");
		int id = Integer.parseInt(idStr);
		
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
	
		try{
			Class.forName("com.mysql.jdbc.Driver");
			String connURL = "jdbc:mysql://localhost/drinkshop?user=root&password=root&serverTimezone=UTC";
			Connection conn = DriverManager.getConnection(connURL);
			Statement stmt = conn.createStatement();
			
			String sqlStr = "UPDATE users SET username= '" + username + "',password= '" + password + "',email='"+ email + "' WHERE id =" + id + ";";
			int rs = stmt.executeUpdate(sqlStr); //executeUpdate returns a int rather than a resultSet
		} catch (Exception e){out.println("Error!" + e);}
		
		response.sendRedirect("loginForm.jsp?status=updated");
	%>  
</body>
</html>