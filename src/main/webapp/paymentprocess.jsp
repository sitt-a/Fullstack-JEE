<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Payment Process</title>
</head>
<body bgcolor="white">
<center>
<%
String mode;
mode=request.getParameter("opt");
if(mode.equals("CBE"))
{
response.sendRedirect("https://www.cbeib.com.et/ARCIB-4/servlet/BrowserServlet");  
}
else
{
%>
<jsp:forward page="credit.jsp"></jsp:forward>
<%
}
%>
</body>
</html>