<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@page import="java.sql.*" %>
      <%@page import="rems_beans.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>My Profile</title>
</head>
<body >
<%
if(session.getAttribute("email")!=null)
{
%>
<center>
<%
String uid=String.valueOf(session.getAttribute("email"));
%>
<h2 Style="color:green">User Profile For <%=uid %></h2>
<%
Connection con;
PreparedStatement pst;
ResultSet rs;
try 
{
	DBConnector dbc=new DBConnector();
	con=dbc.getDbconnection();
	pst=con.prepareStatement("select * from new_table where email=?;");
	pst.setString(1,uid);
	rs=pst.executeQuery();
	
	if(rs.next())
	{
		%>
		<style>

.card {
    width: 500px;
    height:300px;
    background-color: #efefef;
    border: none;
    cursor: pointer;
    transition: all 0.5s;
}

.image img {
    transition: all 0.5s
}

.card:hover .image img {
    transform: scale(1.5)
}

.btn {
    height: 140px;
    width: 140px;
    border-radius: 50%
}
.idd {
    font-size: 14px;
    font-weight: 600
}

.idd1 {
    font-size: 12px
}
.btn1 {
    height: 40px;
    width: 150px;
    border: none;
    background-color:rgb(221, 240, 221) ;
    color:rgb(182, 148, 237);
    font-size: 15px
}
.btn1 a{
	text-decoration:none;s
}


	</style>
		<div class="container mb-4 p-3 d-flex justify-content-center"> 
			<div class="card p-4"> 
				<div class=" image d-flex flex-column justify-content-center align-items-center"> 
					<button class="btn btn-secondary"> <img src="https://i.imgur.com/wvxPV9S.png" height="100" width="100" /></button> \<div class="mb-2"><span class="name "><%=rs.getString("name") %></span></div>
				<div class="d-flex flex-row justify-content-center align-items-center gap-2"> 
				<span class="idd1 m-5"><%=rs.getString("email") %></span> 
		<span><i class="fa fa-copy"></i></span> </div> 
		<div class="d-flex flex-row justify-content-center align-items-center mt-3"> <span class="number">Mobile Number 
		<span class="follow"><%=rs.getString("number") %></span></span> </div> 
		 
		</div> <div class="text mt-3">
		<div class="gap-3 mt-3 icons d-flex flex-row justify-content-center align-items-center"></div> </div> </div>
</div>
	<%	
	}
}
catch(Exception e)
{
	out.println(e);
}

}
else 
{
%>
    <center>
	<h3 style="color:red">Invalid Session</h3>
	
	<a href="login.html"><h4>Login Now</h4></a>
	
<%
}
%>
</body>
</html>