<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@page import="java.sql.*" %>
<%@page import="rems_beans.*" %>
<html>
<head>
<script>
setTimeout(function(){ window.location.href = 'adminpanel.jsp'; }, 4000);
</script>
<meta charset="ISO-8859-1">
<title>User Deleted</title>
<style>
.popup-message {
    position: fixed;
    top: 30%;
    left: 50%;
    transform: translate(-50%, -50%);
    background-color: #f2f2f2;
    padding: 20px;
    border: 1px solid #ccc;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
    text-align: center;
}
</style>
</head>
<body>
<%
String propertyId=request.getParameter("id");
%>
<div class="popup-message">
    <h2 style="color: green">Property Deleted Successfully!</h2>
</div>
<hr>
<%
Connection con;
PreparedStatement pst;
try
{
    DBConnector dbc=new DBConnector();
    con=dbc.getDbconnection(); 
    pst=con.prepareStatement("delete from properties where id=?;");
    pst.setString(1,propertyId);
    pst.executeUpdate();
    con.close();
}
catch(Exception e)
{
    out.println(e);
}
%>
<br>
<
<%
if (session.getAttribute("username") != null) {
%>
<%
} else {
%>


<%
}
%>
</body>
</html>