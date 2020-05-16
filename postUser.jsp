<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import ="java.sql.*"%>  


<!DOCTYPE html>
<html>
<title>Register User</title>
<head>
<meta charset="UTF-8">
</head>
<body>
<%
	String qsUsername = request.getParameter("username");
	String qsEmail = request.getParameter("email");
	String qsPassword = request.getParameter("password");

	try{
		Class.forName("com.mysql.jdbc.Driver");
		String connURL = "jdbc:mysql://localhost/drinkshop?user=root&password=root&serverTimezone=UTC";
		Connection conn = DriverManager.getConnection(connURL);
		Statement stmt = conn.createStatement();
		
		String sqlStr = "INSERT INTO users (username, password, role, email) VALUES('"+ qsUsername + "','" + qsPassword + "','member','" + qsEmail + "');";
		out.print(sqlStr);
		int rs = stmt.executeUpdate(sqlStr);
		conn.close();		
	} catch (Exception e){out.println("Error: " + e);}
	
	response.sendRedirect("registrationForm.jsp?statusCode='success'");
%>

</body>
</html>


