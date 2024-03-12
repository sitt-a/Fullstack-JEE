<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
     <%@page import="rems_beans.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Users List</title>
<link href='https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/css/bootstrap.min.css' rel='stylesheet'>
    <link href="css/real-estate.css" rel="stylesheet">
</head>
<body>
<%
if(session.getAttribute("email")!=null)
{
String name=request.getParameter("nm");
%>
<center>
<br><br>
<h2 Style='color:blue'>All Users List</h2>
<hr><br>
<div class="table-responsive">
            <table class="table table-hover mg-b-0">
              <thead>
                <tr>
                  <th>Name</th>
                  <th>Email</th>
                  <th>Mobile Number</th>
                  <th></th>
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
	
	pst=con.prepareStatement("select * from new_table;");
	
	rs=pst.executeQuery();
	while(rs.next())
	{
		nm=rs.getString("name");
		%>
		
		<tbody>
             <tr>
    <th scope="row"><%=rs.getString("name")%></th>
    <td><%=rs.getString("email")%></td>
    <td><%=rs.getString("number")%></td>
    <td>
        <center>
            <b>
                <a href="deleteuser.jsp?name=<%=nm%>" class="btn btn-danger">Delete User</a>
            </b>
        </center>
    </td>
</tr>
		
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