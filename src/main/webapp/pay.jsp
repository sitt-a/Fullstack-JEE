<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Transaction Page</title>
</head>
<body bgcolor="white">
<%
if(session.getAttribute("email")!=null)
{
%>
<center>
<h2 Style="color:purple"><b>Pay Amount</b></h2>
<hr>

<form name="frm" method="post" action="paymentprocess.jsp">
<table>

<tr>
<td><br><b>Pay Mode -</b>
<td><br><input type="radio" name="opt" value="CBE"><b>CBE</b>
<td><br><input type="radio" name="opt" value="Credit Card"><b>Credit Card</b>
</tr>
<tr>
<td>
<td><br><input type="submit" value="Pay">
<br><br><br>
<a href="contact.html"><b>Contact Us</b></a>
<%
}
else 
{
%>
    <center>
	<h3 style="color:red">Invalid Session</h3>
	<hr>
	<a href="login.html"><h4>Login Now</h4></a>
	
<%
}
%>
</body>
</html>