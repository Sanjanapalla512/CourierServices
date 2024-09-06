<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="p1.DbUtil" %>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String username = request.getParameter("username");
String password = request.getParameter("password");
try
{
	DbUtil.connect();
	ResultSet rs=DbUtil.st.executeQuery("SELECT * FROM users WHERE username = '"+username+"'");
	if (rs.next()) {
        
        String dbPassword = rs.getString("password");
        if (password.equals(dbPassword)) {
            response.sendRedirect("Home2.html");
            
        } else {
            
            response.sendRedirect("login.html?error=incorrect-password");
        }
    } else {
        
        response.sendRedirect("register.html?error=user-not-found");
    }
	DbUtil.st.close();
    DbUtil.con.close();
		
}
catch(Exception e)
{
	out.println("Error");
}
%>
</body>
</html>