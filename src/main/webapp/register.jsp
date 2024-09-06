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
String username = request.getParameter("t1");
String password = request.getParameter("t3");
String email = request.getParameter("t2");
try
{
	DbUtil.connect();
	int i=DbUtil.st.executeUpdate("INSERT INTO users (username, password, email) VALUES ('" + username + "', '" + password + "', '" + email + "')");
	if(i>0)
	{
		response.sendRedirect("Home2.html");
	}
	else
	{
		out.println("<p>Failed to insert user.</p>");
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