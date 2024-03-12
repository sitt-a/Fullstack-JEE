<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
     <%@page import="rems_beans.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href='https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/css/bootstrap.min.css' rel='stylesheet'>
    <link href="css/real-estate.css" rel="stylesheet">
<title>Users Purchase Property List</title>
<style>
   <style>
    td {
        padding: 5px;
    }

    .table-divider-row td {
        border-top: 1px solid #cccccc;
        padding: 0;
    }

    .table-divider-row td:before {
        content: "";
        display: block;
        border-top: 2px solid #000000;
        margin-top: -1px;
    }

    td:not(:last-child) {
        padding-right: 10px;
    }
    a{
    	
    }
</style>
</style>
</head>
<body>
<%
if(session.getAttribute("email")!=null)
{
String name=request.getParameter("nm");
%>

<center>
<br><br>
<h2 Style='color:purple'>All Users Purchase Property List</h2>

<hr><br>

<div class="table-responsive">
            <table class="table table-hover mg-b-0">
              <thead>
                <tr>
        <th>Your Name
    	<th>Property Name
    	<th>Property Price
    	<th>Your Mob. No.
    	<th>Your Address
    	<th>Token Amount Pay
    	<th>Pay Mode
    	<th>Purchase Date
    	<th>Amt. Status
    	<th>
    	<th>
                </tr>
              </thead>
    	
    	
<%
Connection con;
PreparedStatement pst;
ResultSet rs;
String nm;

try
{
	DBConnector dbc=new DBConnector();
	con=dbc.getDbconnection(); 
	
	pst=con.prepareStatement("select * from purchaseproperty;");
	
	rs=pst.executeQuery();
	while(rs.next())
	{
		name=rs.getString("name");
		%>
		<tbody>
    <tr>
        <td><%=name %></td>
        <td><%=rs.getString("pname") %></td>
        <td><%=rs.getString("price") %></td>
        <td><%=rs.getString("mobno") %></td>
        <td><%=rs.getString("adds") %></td>
        <td><%=rs.getDouble("amount") %></td>
        <td><%=rs.getString("pay_mode") %></td>
        <td><%=rs.getDate("pdate") %></td>
        <td><b><%=rs.getString("status") %></b></td>
        <td><b><a class="btn btn-warning" href="https://accounts.google.com/signin/v2/identifier?service=mail&passive=true&rm=false&continue=https%3A%2F%2Fmail.google.com%2Fmail%2F%3Ftab%3Drm%26ogbl&scc=1&ltmpl=default&ltmplcache=2&emr=1&osid=1&flowName=GlifWebSignIn&flowEntry=ServiceLogin" target="_blank">Mail</a></b></td>
        <td><center>
            <b>
                <a href="cancelpurp2.jsp?name=<%=name%>" class="btn btn-danger">Delete Product</a>
            </b>
        </center></td>
       
    </tr>
    <tr class="table-divider-row">
        <td colspan="10"></td>
    </tr>
</tbody>
	<%	
	}
}
catch(Exception e)
{
	out.println(e);
}
%>
</table>
<br>
	

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