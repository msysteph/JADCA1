<%@page import ="java.sql.*"%>  
<%
	
	String id = request.getParameter("id");

	if(request.getParameter("action").equals("delete")) {
		try{
			Class.forName("com.mysql.jdbc.Driver");
			String connURL = "jdbc:mysql://localhost/drinkshop?user=root&password=root&serverTimezone=UTC";
			Connection conn = DriverManager.getConnection(connURL);
			PreparedStatement stmt = conn.prepareStatement("DELETE from menu WHERE id=?");
			stmt.setString(1,id);
			
			stmt.execute();
			
			conn.close();		
		} catch(Exception e) {
			out.println("Error: " + e);
			return;
		}
		
		response.sendRedirect("adminPage.jsp?statusCode=deleteSuccess");
		
	} else if(request.getParameter("action").equals("update")){
		try{
			Class.forName("com.mysql.jdbc.Driver");
			String connURL = "jdbc:mysql://localhost/drinkshop?user=root&password=root&serverTimezone=UTC";
			Connection conn = DriverManager.getConnection(connURL);
			PreparedStatement stmt = conn.prepareStatement("UPDATE menu SET name=?, description_short=?, description_long=?, cost_price=?, retail_price=?, stock_quantity=?, product_category=?, image_location=? WHERE id=?;");
			stmt.setString(1, request.getParameter("name"));
			stmt.setString(2, request.getParameter("description_short"));
			stmt.setString(3, request.getParameter("description_long"));
			stmt.setString(4, request.getParameter("cost_price"));
			stmt.setString(5, request.getParameter("retail_price"));
			stmt.setString(6, request.getParameter("stock_quantity"));
			stmt.setString(7, request.getParameter("product_category"));
			stmt.setString(8, request.getParameter("image_location"));
			stmt.setString(9, request.getParameter("id"));
			out.println(stmt);
			
			stmt.executeUpdate();
			
			conn.close();		
		} catch(Exception e) {
			out.println("Error: " + e);
			return;
		}
		
		response.sendRedirect("adminPage.jsp?statusCode=updateSuccess");
	} else if(request.getParameter("action").equals("add")) {
		try{
			Class.forName("com.mysql.jdbc.Driver");
			String connURL = "jdbc:mysql://localhost/drinkshop?user=root&password=root&serverTimezone=UTC";
			Connection conn = DriverManager.getConnection(connURL);
			PreparedStatement stmt = conn.prepareStatement("INSERT INTO menu(name, description_short, description_long, cost_price, retail_price, stock_quantity, product_category, image_location) VALUES (?, ?, ?, ?, ?, ?, ?, ?);");
			stmt.setString(1, request.getParameter("name"));
			stmt.setString(2, request.getParameter("description_short"));
			stmt.setString(3, request.getParameter("description_long"));
			stmt.setString(4, request.getParameter("cost_price"));
			stmt.setString(5, request.getParameter("retail_price"));
			stmt.setString(6, request.getParameter("stock_quantity"));
			stmt.setString(7, request.getParameter("product_category"));
			stmt.setString(8, request.getParameter("image_location"));
			out.println(stmt);
			
			stmt.execute();
			
			conn.close();		
		} catch(Exception e) {
			out.println("Error: " + e);
			return;
		}

		response.sendRedirect("adminPage.jsp?statusCode=addSuccess");
	}
%>