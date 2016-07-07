<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add a User</title>
</head>
<body>
<div>
<table>
<%
String uName = request.getParameter("uName");
String pass = request.getParameter("pass");
String email = request.getParameter("email");
String fName = request.getParameter("fName");

//out.println(uName+pass+email+fName);
Connection con = null;
Statement st = null;
int rs = 0;
String url = "jdbc:mysql://localhost:3306/webproducts";
//DO NOT include this info in .java files pushed to GitHub in real projects
String user = "java";
String password = "java123";


try 
{
    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection(url, user, password);
    st = con.createStatement();
    
    String query="INSERT INTO users(username, password, email, fullName) VALUES(\"" + uName + "\",\"" + pass + "\",\"" + email + "\",\"" + fName + "\")";
    String selectQuery = "SELECT * FROM Movies";

    PreparedStatement updateStatement = con.prepareStatement(query);
    //PreparedStatement selectStatement = con.prepareStatement(selectQuery);
    
     if(request.getParameter("uName") == null)
    {
      out.println("ERROR: Please Enter the missing fileds(Username)");
    }
     
   	rs = updateStatement.executeUpdate(query);
   	
   	
     
    // ResultSet rs2 = selectStatement.executeQuery(selectQuery);
    
  /*    while (rs2.next()) 
    {
            int id = rs2.getInt(1);
            String mTitle = rs2.getString(2);
            String mGenre = rs2.getString(3);
            out.println("<tr>"+"<td>"+ id +"</td>"+"<td>" +mTitle+ "</td>"+"<td>"+ mGenre + "</td></tr>");
    }   */
} catch (SQLException e) {
    out.println("DB Exception: " + e);

} finally {
    try {
        if (rs > 0 ) {
            //rs2.close();
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
</table>
</div>
</body>
</html>