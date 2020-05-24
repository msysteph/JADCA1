<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>


<!DOCTYPE html>
<html>
<title>Post User</title>
<head>
<meta charset="UTF-8">
</head>
<body>
	<%
		String qsUsername = request.getParameter("username");
	String qsEmail = request.getParameter("email");
	String qsPassword = request.getParameter("password");

	try {
		Class.forName("com.mysql.jdbc.Driver");
		String connURL = "jdbc:mysql://localhost/drinkshop?user=root&password=root&serverTimezone=UTC";
		Connection conn = DriverManager.getConnection(connURL);
		PreparedStatement stmt = conn
		.prepareStatement("INSERT INTO users (username, password, role, email) VALUES(?,?,'member',?);");
		stmt.setString(1, qsUsername);
		stmt.setString(2, qsPassword);
		stmt.setString(3, qsEmail);

		int rs = stmt.executeUpdate();
		conn.close();
	} catch (Exception e) {
		out.println("Error: " + e);
	}
	response.sendRedirect("registrationForm.jsp?statusCode='success'");
	%>

</body>
</html>


