<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import ="java.sql.*"%>  

<!DOCTYPE html>
<html>
<title>Update User</title>
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
		String id = request.getParameter("id");		
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
	
		try{
			Class.forName("com.mysql.jdbc.Driver");
			String connURL = "jdbc:mysql://localhost/drinkshop?user=root&password=root&serverTimezone=UTC";
			Connection conn = DriverManager.getConnection(connURL);
			PreparedStatement stmt = conn.prepareStatement("UPDATE users SET username=?, password=?, email=? WHERE id=?;");
			stmt.setString(1, username);
			stmt.setString(2, password);
			stmt.setString(3, email);
			stmt.setString(4, id);
			
			int rs = stmt.executeUpdate(); //executeUpdate returns a int rather than a resultSet
		} catch (Exception e){out.println("Error!" + e);}
		
		response.sendRedirect("loginForm.jsp?status=updated");
	%>  
</body>
</html>