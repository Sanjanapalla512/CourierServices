<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="p1.DbUtil" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
try {
    DbUtil.connect();
    String senderName = request.getParameter("senderName");
    String senderAddress = request.getParameter("senderAddress");
    String receiverName = request.getParameter("receiverName");
    String receiverAddress = request.getParameter("receiverAddress");
    String deliveryDate = request.getParameter("deliveryDate");
    int id = Integer.parseInt(request.getParameter("id"));
    
    
    int i = DbUtil.st.executeUpdate("INSERT INTO Orders (id, sender_name, sender_address, receiver_name, receiver_address, delivery_date) VALUES ("+id+",'"+senderName+"','"+senderAddress+"','"+receiverName+"','"+receiverAddress+"','"+deliveryDate+"')");
    if(i > 0) {
    	ResultSet rs=DbUtil.st.executeQuery("select * from ordercount where id = 1");
    	if(rs.next()){
    		int c=rs.getInt("c");
    		c=c+1;
    		int j=DbUtil.st.executeUpdate("update ordercount set c ="+c+" where id = 1");
    	}
        response.sendRedirect("checkout.jsp");
    } else {
        out.println("<p>Failed to place order.</p>");
    }
    DbUtil.st.close();
    DbUtil.con.close();
} catch(Exception e) {
    
    out.println("<p>Error: " + e.getMessage() + "</p>");
}
%>
</body>
</html>
