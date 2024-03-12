<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%@page import="rems_beans.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Purchase Property Record Page</title>
<style>
    body {
      background-color: #F2F2F2;
      font-family: Arial, sans-serif;
    }

    h2 {
      color: black;
    }

    .record-container {
      display: flex;
      flex-direction: column;
      align-items: flex-start;
      margin: 20px;
    }

    .record-container div {
      margin-bottom: 10px;
    }

    a {
      color: #0000FF;
      text-decoration: none;
    }

    a:hover {
      text-decoration: underline;
    }

    .error {
      color: red;
    }
</style>
</head>
<body>
<%
if(session.getAttribute("email")!=null)
{
%>
<center>
<%
Connection con;
PreparedStatement pst;
ResultSet rs;
String pname=request.getParameter("pnme");
String name=request.getParameter("nme");

try
{	
	DBConnector dbc=new DBConnector();
	con=dbc.getDbconnection(); 
	
	pst=con.prepareStatement("select * from purchaseproperty where pname=? and name=?;");
	pst.setString(1, pname);
	pst.setString(2, name);
    rs=pst.executeQuery();
    if(rs.next())
	{
    	
%>
    	<h2 style="color:black">Your Purchase Property Record</h2>
		<hr>
		<br>

    	<div class="record-container">
          <div>
            <strong>Your Name:</strong> <%= rs.getString("name") %>
          </div>
          <div>
            <strong>Property Name:</strong> <%= rs.getString("pname") %>
          </div>
          <div>
            <strong>Property Price:</strong> <%= rs.getString("price") %>
          </div>
          <div>
            <strong>Your Mob. No.:</strong> <%= rs.getString("mobno") %>
          </div>
          <div>
            <strong>Your Address:</strong> <%= rs.getString("adds") %>
          </div>
          <div>
            <strong>Token Amount Pay:</strong> <%= rs.getDouble("amount") %>
          </div>
          <div>
            <strong>Pay Mode:</strong> <%= rs.getString("pay_mode") %>
          </div>
          <div>
            <strong>Purchase Date:</strong> <%= rs.getDate("pdate") %>
          </div>
          <div>
            <strong>Amt. Status:</strong> <%= rs.getString("status") %>
          </div>
          
        </div>
	    
<%	
}
    else {
    	out.println("<h2 style='color:brown'>ERROR</h2>");
    	out.println("<hr>");
    	out.println("<h3 style='color:red'>Please Check Your Name & Property Name</h3>");
    	out.println("<h3 style='color:black'>OR</h3>");
    	out.println("<h3 style='color:red'>No Record Found...!</h3>");
    }
}
catch(Exception e)
{
	out.println(e);
}
%>
<br>
<br>
<br><br>
<hr><br>	

<%
}
else 
{
%>
    <center>
	<h3 style="color:red">Invalid Session</h3>
	<hr>
	<a href="login.html"><b>Login Now</b></a>
<%
}
%>
</body>
</html>