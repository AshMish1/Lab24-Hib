
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Users</title>

</head>

<body>

	<%
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		String url = "jdbc:mysql://localhost:3306/webproducts";
		//DO NOT include this info in .java files pushed to GitHub in real projects
		String user = "java";
		String password = "java123";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(url, user, password);
			st = con.createStatement();
			String query = "SELECT * FROM users";
			rs = st.executeQuery(query);
			out.println(
					"<table style=\"margin: 0 auto;\" cellspacing=\"5\"><tr><th>ID</th><th>Username</th><th>Full Name</th></tr>");
			boolean gray = true;
			rs = st.executeQuery(query);
			while (rs.next()) {
				String username = rs.getString(1);
				String uPassword = rs.getString(2);
				String email = rs.getString(3);
				String fullName = rs.getString(4);
				if (gray) {
					out.print("<tr style=\"background-color: #ccc;\">");
				} else {
					out.print("<tr>");
				}
				out.println("<td>" + username + "</td><td>" + fullName + "</td><td>" + email + "</td></tr>");
				gray = !gray;
			}
			out.println("</table>");
			out.println("<a href=\"index.html\">Return</a>");
		} catch (SQLException e) {
			out.println("DB Exception: " + e);
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (st != null) {
					st.close();
				}
				if (con != null) {
					con.close();
				}
			} catch (SQLException e) {
				out.println("DB Exception in finally: " + e);
			}
		}
	%>

</body>

</html>