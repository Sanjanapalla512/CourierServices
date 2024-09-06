<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="p1.DbUtil" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Check</title>
</head>
<body>
<%
try {
    DbUtil.connect();
    ResultSet r1=DbUtil.st.executeQuery("select * from ordercount where id = 1");
    if(r1.next())
    {
    	int count=r1.getInt("id");
    	ResultSet r2=DbUtil.st.executeQuery("select * from orders where order_id = "+count);
    	if(r2.next())
    	{
    		out.println(" Order ID : "+r2.getInt("order_id"));
    		out.println(" Sender name : "+r2.getString("sender_name"));
    		out.println(" Sender Address : "+r2.getString("sender_address"));
    		out.println(" Receiver name : "+r2.getString("receiver_name"));
    		out.println(" Receiver Address : "+r2.getString("receiver_address"));
    		
    	}
    }
}
catch(Exception e) {
    // Print the exception message or stack trace
    out.println("<p>Error: " + e.getMessage() + "</p>");
}
%>

</body>
</html>