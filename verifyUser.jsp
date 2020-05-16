 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
  pageEncoding="ISO-8859-1"%>
 <%@page import ="java.sql.*"%>
 
<!DOCTYPE html>
<html>
<head>
	<title>Validate</title>
</head>
<body>
    <%
	    String username= request.getParameter("username");
	    String password= request.getParameter("password");
	    
		try {
				Class.forName("com.mysql.jdbc.Driver");
				String connURL = "jdbc:mysql://localhost/drinkshop?user=root&password=root&serverTimezone=UTC";
				Connection conn = DriverManager.getConnection(connURL);
				PreparedStatement stmt = conn.prepareStatement("SELECT id, username, role FROM users WHERE username=? AND password=?;");
				stmt.setString(1, username);
				stmt.setString(2, password);
				ResultSet rs = stmt.executeQuery();

		
				if( rs.next()){
					String validatedID = rs.getString(1);
					String validatedUsername = rs.getString(2);
					String validatedRole = rs.getString(3);
					
					if(validatedRole.equals("admin")){
						response.sendRedirect("adminPage.jsp?id="+validatedID);
					}
					
					response.sendRedirect("memberPage.jsp?id="+validatedID);
				} 
				
				else {
			    	response.sendRedirect("loginForm.jsp?status=invalid"); 
					conn.close();
			   	}
				
			} catch (Exception e){out.println("Error! " + e);}
	%>
</body>
</html>
